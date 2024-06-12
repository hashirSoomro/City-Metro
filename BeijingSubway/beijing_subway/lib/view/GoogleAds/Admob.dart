import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMob extends StatefulWidget {
  const AdMob({super.key});

  @override
  State<AdMob> createState() => _AdMobState();
}

class _AdMobState extends State<AdMob> {
  BannerAd bAd = new BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(onAdLoaded: (Ad ad) {
        print("add loaded");
      }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print("add loaded failed");
        ad.dispose();
      }, onAdOpened: (Ad ad) {
        print("Ad Opened");
      }),
      request: AdRequest());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: AdWidget(
          ad: bAd..load(),
          key: UniqueKey(),
          ),
          height: 50,
      ),
    );
  }
}
