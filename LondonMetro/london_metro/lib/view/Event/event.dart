import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../adMobHelper/adMobHelper.dart';
import '../AllWidgets/appBar.dart';
import '../home/widget/drawer.dart';
import 'widget/myListView.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(
          heading: "Heading1",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [Expanded(child: MyListView2())],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: AdWidget(
          ad: AdMobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
        height: 92,
        width: MediaQuery.of(context).size.width * 1.1,
      ),
    );
  }
}
