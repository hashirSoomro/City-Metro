// ignore: file_names
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../AdMobHelper/AdMobHelper.dart';
import '../../component/constant.dart';
import '../initializer/initializer.dart';
import 'widget/drawer.dart';
// adUnitId: "ca-app-pub-4134896162060991/2949297666",

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  BannerAd bAd = new BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-4134896162060991/2949297666",
      listener: BannerAdListener(onAdLoaded: (Ad ad) {
        print("add loaded");
      }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print("add loaded failed");
        ad.dispose();
      }, onAdOpened: (Ad ad) {
        print("Ad Opened");
      }),
      request: AdRequest());

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
                    // height: MediaQuery.of(context).size.height*0.9,
                    child: InteractiveViewer(
                  // interactionEndFrictionCoefficient: 1,
                  constrained: false,
                  scaleFactor: 100,
                  minScale: 0.05,
                  maxScale: 20.0,
                  child: Image.asset(
                    "assets/Map.jpg",
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
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: const CircleAvatar(
                  // radius: 22.5,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.menu,
                    color: ConstantColor.blue,
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
                  Get.offAll(Initializer(),
                      transition: Transition.rightToLeftWithFade);
                },
                child: const CircleAvatar(
                  // radius: 22.5,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: ConstantColor.blue,
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
        height: 100,
        width: MediaQuery.of(context).size.width * 1.1,
      ),
    );
  }
}
