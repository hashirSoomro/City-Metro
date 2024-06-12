// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../AdMobHelper/AdMobHelper.dart';
import '../global-constants.dart';
import '../initializer/initializer2.dart';
import 'widget/drawer.dart';
// adUnitId: "ca-app-pub-4134896162060991/2949297666",

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MyDrawer(),
      body: Stack(
        children: [
          FutureBuilder(
            future: Future.delayed(Duration()), // Simulate image loading delay
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:
                        CircularProgressIndicator()); // Show circular loading indicator
              } else {
                return SizedBox(
                    child: InteractiveViewer(
                  // interactionEndFrictionCoefficient: 1,
                  constrained: false,
                  scaleFactor: 100,
                  minScale: 0.05,
                  maxScale: 20.0,
                  child: Image.asset(
                    map_img,
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                ));
              }
            },
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Builder(builder: (context) {
              return InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.menu,
                      color:
                          Colors.blue, // replace with your ConstantColor.blue
                    ),
                  ),
                ),
              );
            }),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Builder(builder: (context) {
              return InkWell(
                onTap: () {
                  Get.offAll(Initializer2(),
                      transition: Transition.rightToLeftWithFade);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color:
                          Colors.blue, // replace with your ConstantColor.blue
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        child: AdWidget(
          ad: AdMobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
        height: 70,
        width: MediaQuery.of(context).size.width * 1.1,
      ),
    );
  }
}
