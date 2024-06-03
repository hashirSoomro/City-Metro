import 'dart:async';

// import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:new_york/view/initializer/widget/button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../adMobHelper/adMobHelper.dart';
import '../../api/city-links-service.dart';
import '../../component/constant.dart';
import '../../getLanguage/getLanguage.dart';
import '../home/homeView.dart';
import '../Event/event.dart';

class Initializer extends StatefulWidget {
  const Initializer({super.key});

  @override
  State<Initializer> createState() => _InitializerState();
}

class _InitializerState extends State<Initializer>
    with TickerProviderStateMixin {
  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  Future<void> _launchUrl(url) async {
    if (await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _fetchLinks() async {
    try {
      final links = await _cityLinksService.getCityLinks("seoul");
      setState(() {
        eventsLink = links['eventsUrl'];
        print(eventsLink);
        hotelsLink = links['hotelsUrl'];
        print(hotelsLink);

        eventUri = Uri?.https(eventsLink!);
        hotelUri = Uri?.https(hotelsLink!);
        // Uri? eventUri = eventsLink != null ? Uri.parse(eventsLink!) : null;
        // Uri? hotelUri = hotelsLink != null ? Uri.parse(hotelsLink!) : null;
      });
    } catch (error) {
      // Handle error
      print('Error fetching links: $error');
    }
  }

  // final Language language = Get.put(Language());
  late CityLinksService _cityLinksService;
  String? eventsLink;
  String? hotelsLink;
  Uri? eventUri;
  Uri? hotelUri;
  // late String _selectedLanguage = "English";

  // Locale locale = _selectedLanguage;
  // bool isLoading = false;

  late final AnimationController _controller1;
  late final AnimationController _controller2;
  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;

  @override
  void initState() {
    super.initState();
    _cityLinksService = CityLinksService(); // Instantiate CityLinksService
    _fetchLinks(); // Call the method to fetch links from Firebase

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation1 = Tween<Offset>(
      begin: const Offset(0, -1), // Start from top
      end: Offset.zero, // End at the center
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0, 1), // Start from bottom
      end: Offset.zero, // End at the center
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeInOut,
      ),
    );

    _controller1.forward();
    _controller2.forward();
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider selectedLanguage = Provider.of<LanguageProvider>(context);
    String language = selectedLanguage.selectedLanguage;
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/train_pic.jpg'), fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    right: 20,
                    child: Container(
                      height: 36,
                      width: 86,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                          child: DropdownButton<String>(
                        style: TextStyle(),
                        autofocus: false,
                        borderRadius: BorderRadius.circular(6),
                        underline: Container(),
                        icon: Icon(
                          Icons.language,
                          color: ConstantColor.blue,
                        ),
                        value: language,
                        onChanged: (String? newValue) {
                          selectedLanguage.updateLanguage(newValue);
                          // setState(() {
                          //   language = newValue!;
                          //   Get.updateLocale(Locale(language));
                          // });

                          // selectedLanguage = _selectedLanguage;
                          // language.changeLanguage(_selectedLanguage)
                          // language.changeLanguage(newValue);
                          //  RxString _selectedLanguage = newValue.toRxString();
                        },
                        items: <String>[
                          'Korean',
                          'English',
                          'Russian',
                          'Chinese',
                          'Turkish',
                          'Urdu',
                          'Hindi',
                          'Arabic'
                        ].map<DropdownMenuItem<String>>((String countries) {
                          // print(value);
                          return DropdownMenuItem<String>(
                            value: countries,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                countries,
                                style: GoogleFonts.montserrat(
                                    color: ConstantColor.blue,
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )),
                          );
                        }).toList(),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            // hotelUri==null?150:50,
                            height: language == 'Urdu' && language == "Arabic"
                                ? MediaQuery.of(context).size.height * 0.3
                                : MediaQuery.of(context).size.height * 0.4),
                        SlideTransition(
                          position: _slideAnimation1,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "text1".tr,
                                style: GoogleFonts.openSans(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayMedium),
                              ),
                              Text(
                                "text2".tr,
                                style: GoogleFonts.openSans(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        SlideTransition(
                          position: _slideAnimation2,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyButton(
                                  onPressed: () {
                                    Get.to(HomeView(),
                                        transition:
                                            Transition.rightToLeftWithFade);
                                    // analytics
                                    //     .setAnalyticsCollectionEnabled(true);
                                    // analytics.logEvent(name: 'metro_map');
                                  },
                                  color: ConstantColor.blue,
                                  height: 51,

                                  // width: MediaQuery.of(context).size.width*0.772,
                                  child: Text("button1".tr,
                                      style: GoogleFonts.montserrat(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                MyButton(
                                  onPressed: () {
                                    Get.to(EventView(),
                                        transition:
                                            Transition.rightToLeftWithFade);
                                    // analytics
                                    //     .setAnalyticsCollectionEnabled(true);
                                    // analytics.logEvent(name: 'metro_map');
                                  },
                                  color: Colors.transparent,
                                  borderColor: Colors.white,
                                  height: 51,

                                  // width: MediaQuery.of(context).size.width*0.772,
                                  child: Text("Heading1".tr,
                                      style: GoogleFonts.montserrat(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  child: AdWidget(
                                    ad: AdMobHelper.getBannerAd()..load(),
                                    key: UniqueKey(),
                                  ),
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 1.1,
                                ),
                              ]),
                        ),
                        // SizedBox(height: 60,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
