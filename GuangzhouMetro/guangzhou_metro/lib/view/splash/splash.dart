import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../initializer/initializer.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation3;
  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;
  late final AnimationController _controller1;
  late final AnimationController _controller2;
  late final AnimationController _controller3;
  bool _showSecondImage = false;
  // bool _isComplete = false;
  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Animation for Train image sliding from top to center
    _slideAnimation1 = Tween<Offset>(
      begin: const Offset(-0.2, -12.0),
      end: Offset(-0.4, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    // Animation for Train image sliding from center to left
    _slideAnimation2 = Tween<Offset>(
      begin: Offset(-0.2, 0.0),
      end: const Offset(-0.6, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    // Animation for MetroTrain image sliding from center to right
    _slideAnimation3 = Tween<Offset>(
      begin: Offset(0.6, 0),
      end: const Offset(1.0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Animation for Train image scaling
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 500.0, // Scale out to double its original size
    ).animate(
      CurvedAnimation(
        parent: _controller3,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Start the first animation for Train image sliding from top to center
    _controller1.forward().then((_) {
      // Pause for 500 milliseconds
      Future.delayed(const Duration(microseconds: 500), () {
        setState(() {
          _showSecondImage = true;
        });
        // Start the second animation for Train image sliding from center to left
        _controller2.forward().then((_) {
          // Start the third animation for MetroTrain image sliding from center to right
          _controller3.forward().then((_) {
            // Start the fourth animation for scaling the Train image
            Future.delayed(Duration(microseconds: 500), () {
              _controller3.forward().then((_) {
                // Get.toNamed(Initializer(),transition: Transition.fadeIn);
                // After all animations complete, navigate to the home page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Initializer()),
                );
              });
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _showSecondImage ? 1 : 0.0,
              duration: const Duration(seconds: 1),
              child: SlideTransition(
                position: _slideAnimation3,
                child: Container(
                  width: 100,
                  height: 100,
                  child: SvgPicture.asset("assets/GuangzhouMetro.svg")
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation2,
              child: SlideTransition(
                position: _slideAnimation1,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                      width: 100,
                      height: 100,
                      child: SvgPicture.asset("assets/train_logo.svg") //,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }
}
