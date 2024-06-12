import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../AdMobHelper/AdMobHelper.dart';
import '../../getLanguage/getLanguage.dart';
import '../AllWidgets/appBar.dart';
import '../home/widget/drawer.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    LanguageProvider selectedLanguage = Provider.of<LanguageProvider>(context);
    String language = selectedLanguage.selectedLanguage;
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(
          heading: "Heading4",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: (language == 'Urdu' || language == 'Arabic')
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start, //urdu
            children: [
              Text(
                'Publish'.tr,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF018FD7),
                  ),
                ),
                textAlign: (language == 'Urdu' || language == 'Arabic')
                    ? TextAlign.end
                    : TextAlign.start, //urdu
              ),
              Text(
                'PublishText'.tr,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1F1F1F),
                  ),
                ),
              )
            ],
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
