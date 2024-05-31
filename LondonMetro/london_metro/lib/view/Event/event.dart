import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:london_metro/view/Event/widget/myListView.dart';




import '../../component/constant.dart';
import '../home/widget/drawer.dart';
import '../initializer/initializer.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  // List<Map<String,dynamic>> hotels =HotelData
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    BannerAd bAd = new BannerAd(
        size: AdSize.largeBanner,
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Get.to(Initializer());
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                    )
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: ConstantColor.blue,
                  ),
                ),
              )),
        ),
        title: Center(
          child: Text(
            'Heading1'.tr,
            style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.bodySmall),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      endDrawer: const MyDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(child: MyListView2())
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: AdWidget(
          ad: bAd..load(),
          key: UniqueKey(),
        ),
        height: 100,
        width: MediaQuery.of(context).size.width * 1.1,
      ),
    );
  }
}
