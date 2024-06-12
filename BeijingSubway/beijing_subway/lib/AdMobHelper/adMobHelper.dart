import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobHelper {
  static bool getAd = true;
  static String get bannerUnit => "ca-app-pub-4134896162060991/1844176505";
  static initialization() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd getBannerAd() {
    BannerAd bAd = new BannerAd(
        size: AdSize.largeBanner,
        adUnitId: "ca-app-pub-4134896162060991/1844176505",
        listener: BannerAdListener(onAdLoaded: (Ad ad) {
          print("add loaded");
        }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
          getAd = false;
          print("add loaded failed");

          ad.dispose();
        }, onAdOpened: (Ad ad) {
          print("Ad Opened");
        }),
        request: AdRequest());
    return bAd;
  }
}
