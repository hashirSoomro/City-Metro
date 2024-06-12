import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final color;
  final borderColor;
  // final double width;
  final double height;

  const MyButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.color,
    this.borderColor=Colors.transparent,
    // this.width = 371.0, // Default width
    this.height = 51.0, // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side:  BorderSide(
          width: 1.0,
          color: borderColor,
        ),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 4,
        // ignore: deprecated_member_use
        primary: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.2),
        // Set width and height
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        child: Container(
          // width: width, // Set width
          height: height, // Set height
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
