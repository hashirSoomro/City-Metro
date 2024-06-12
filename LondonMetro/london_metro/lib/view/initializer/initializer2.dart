import 'dart:async';
import 'dart:ui';

// import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:london_metro/view/initializer/widget/button.dart';

import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../adMobHelper/adMobHelper.dart';
import '../../component/constant.dart';
import '../../getLanguage/getLanguage.dart';
import '../About/about.dart';
import '../Contact/contactUs.dart';
import '../global-constants.dart';
import '../home/homeView.dart';
import '../Event/event.dart';
import '../home/widget/drawer.dart';
import '../weather/weather.dart';
import 'services/clicks.dart';
import 'widget/rating_widget.dart';

class Initializer2 extends StatefulWidget {
  const Initializer2({super.key});

  @override
  State<Initializer2> createState() => _Initializer2State();
}

class _Initializer2State extends State<Initializer2>
    with TickerProviderStateMixin {
  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  // Future<void> _launchUrl(url) async {
  //   if (await launchUrl(url, mode: LaunchMode.inAppWebView)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }

  Future<void> _launchUrl(url) async {
    if (await launchUrl(
      url,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _fetchLinks() async {
    try {
      //final links = await _cityLinksService.getCityLinks("seoul");
      setState(() {
        //eventsLink = links['eventsUrl'];
        print(eventsLink);
        // hotelsLink = links['hotelsUrl'];
        // print(hotelsLink);

        eventUri = Uri?.https(eventsLink!);
        //hotelUri = Uri?.https(hotelsLink!);
        // Uri? eventUri = eventsLink != null ? Uri.parse(eventsLink!) : null;
        // Uri? hotelUri = hotelsLink != null ? Uri.parse(hotelsLink!) : null;
      });
    } catch (error) {
      // Handle error
      print('Error fetching links: $error');
    }
  }

  // Future<void> showRatingPopup(
  //     BuildContext context, ClickController clickController) async {
  //   if (clickController.clicks.value >= 5) {
  //     return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return RatingPopup(
  //           onRatingSubmit: (rating) {
  //             // Handle the submitted rating here
  //             print('Rating submitted: $rating');
  //             //You can also send this rating to your server or use it as needed
  //           },
  //         );
  //       },
  //     );
  //   }
  // }

  // final Language language = Get.put(Language());
  //late CityLinksService _cityLinksService;
  String? eventsLink;
  String? hotelsLink;
  Uri? eventUri;
  String hotelUri = hotel_uri;
  final ClickController clickController = Get.put(ClickController());
  // late String _selectedLanguage = "English";

  // Locale locale = _selectedLanguage;
  // bool isLoading = false;
  late AnimationController _controller;
  // late final AnimationController _controller1;
  // late final AnimationController _controller2;
  late Animation<Offset> _offsetAnimation;
  // late Animation<Offset> _slideAnimation1;
  // late Animation<Offset> _slideAnimation2;

  @override
  void initState() {
    super.initState();
    //_cityLinksService = CityLinksService(); // Instantiate CityLinksService
    _fetchLinks(); // Call the method to fetch links from Firebase
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // _controller1 = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 0),
    // );
    // _controller2 = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 0),
    // );

    // _slideAnimation1 = Tween<Offset>(
    //   begin: const Offset(-1, 0), // Start from top
    //   end: Offset.zero, // End at the center
    // ).animate(
    //   CurvedAnimation(
    //     parent: _controller1,
    //     curve: Curves.easeInOut,
    //   ),
    // );

    // _slideAnimation2 = Tween<Offset>(
    //   begin: const Offset(1, 0), // Start from bottom
    //   end: Offset.zero, // End at the center
    // ).animate(
    //   CurvedAnimation(
    //     parent: _controller2,
    //     curve: Curves.easeInOut,
    //   ),
    // );

    _controller.forward();
    // _controller1.forward();
    // _controller2.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    // _controller1.dispose();
    // _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider selectedLanguage = Provider.of<LanguageProvider>(context);
    String language = selectedLanguage.selectedLanguage;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Get.height * 0.65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(init_train), fit: BoxFit.cover),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(init_train_half), fit: BoxFit.cover),
              ),
            ),
          ),
          Scaffold(
            endDrawer: MyDrawer(),
            appBar: AppBar(
              actions: [
                Container(
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
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                        )),
                      );
                    }).toList(),
                  )),
                ),
                SizedBox(
                  width: Get.width / 1.75,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Builder(builder: (context) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.menu,
                            color: Colors
                                .blue, // replace with your ConstantColor.blue
                          ),
                        ),
                      ),
                    );
                  }),
                )
              ],
              surfaceTintColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SlideTransition(
                  position: _offsetAnimation,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.6,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.23),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(36),
                            topRight: Radius.circular(36),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:
                              (language == 'Urdu' || language == 'Arabic')
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start, //urdu
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 26,
                                right: 26,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    (language == 'Urdu' || language == 'Arabic')
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start, //urdu
                                children: [
                                  Text(
                                    "text1".tr,
                                    style: GoogleFonts.openSans(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "text2".tr,
                                    style: GoogleFonts.openSans(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                        fontSize: 60),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 26,
                                right: 26,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyButton(
                                        onPressed: () {
                                          Get.to(HomeView(),
                                              transition: Transition
                                                  .rightToLeftWithFade);
                                          // analytics
                                          //     .setAnalyticsCollectionEnabled(true);
                                          // analytics.logEvent(name: 'metro_map');
                                        },
                                        color: ConstantColor.blue,

                                        // width: MediaQuery.of(context).size.width*0.772,
                                        child: Text(
                                          "sidebartext1".tr,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall),
                                          textAlign: (language == 'Urdu' ||
                                                  language == 'Arabic')
                                              ? TextAlign.end
                                              : TextAlign.start, //urdu
                                        ),
                                      ),
                                      MyButton(
                                        onPressed: () async {
                                          // clickController.incrementClicks();
                                          // if (clickController.clicks.value >=
                                          //     5) {
                                          //   await showRatingPopup(
                                          //       context, clickController);
                                          // }

                                          Get.to(EventView(),
                                              transition: Transition
                                                  .rightToLeftWithFade);
                                          // analytics
                                          //     .setAnalyticsCollectionEnabled(true);
                                          // analytics.logEvent(name: 'metro_map');
                                        },
                                        color: Colors.transparent,
                                        borderColor: Colors.white,

                                        // width: MediaQuery.of(context).size.width*0.772,
                                        child: Text(
                                          "Heading1".tr,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                          textAlign: (language == 'Urdu' ||
                                                  language == 'Arabic')
                                              ? TextAlign.end
                                              : TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyButton(
                                        onPressed: () {
                                          _launchUrl(Uri.parse(hotelUri));
                                          // Get.to(EventView(),
                                          //     transition: Transition
                                          //         .rightToLeftWithFade);
                                          // analytics
                                          //     .setAnalyticsCollectionEnabled(true);
                                          // analytics.logEvent(name: 'metro_map');
                                        },
                                        color: Colors.transparent,
                                        borderColor: Colors.white,

                                        // width: MediaQuery.of(context).size.width*0.772,
                                        child: Text(
                                          "sidebartext4".tr,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall),
                                          textAlign: (language == 'Urdu' ||
                                                  language == 'Arabic')
                                              ? TextAlign.end
                                              : TextAlign.start,
                                        ),
                                      ),
                                      MyButton(
                                        onPressed: () {
                                          Get.to(MyWeather(),
                                              transition: Transition
                                                  .rightToLeftWithFade);
                                          // analytics
                                          //     .setAnalyticsCollectionEnabled(true);
                                          // analytics.logEvent(name: 'metro_map');
                                        },
                                        color: Colors.transparent,
                                        borderColor: Colors.white,

                                        // width: MediaQuery.of(context).size.width*0.772,
                                        child: Text(
                                          "sidebartext5".tr,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall),
                                          textAlign: (language == 'Urdu' ||
                                                  language == 'Arabic')
                                              ? TextAlign.end
                                              : TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyButton(
                                        onPressed: () {
                                          Get.to(About(),
                                              transition: Transition
                                                  .rightToLeftWithFade);
                                          // analytics
                                          //     .setAnalyticsCollectionEnabled(true);
                                          // analytics.logEvent(name: 'metro_map');
                                        },
                                        color: Colors.transparent,
                                        borderColor: Colors.white,

                                        // width: MediaQuery.of(context).size.width*0.772,
                                        child: Text(
                                          "sidebartext6".tr,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall),
                                          textAlign: (language == 'Urdu' ||
                                                  language == 'Arabic')
                                              ? TextAlign.end
                                              : TextAlign.start,
                                        ),
                                      ),
                                      MyButton(
                                        onPressed: () {
                                          Get.to(ContactUs(),
                                              transition: Transition
                                                  .rightToLeftWithFade);
                                          // analytics
                                          //     .setAnalyticsCollectionEnabled(true);
                                          // analytics.logEvent(name: 'metro_map');
                                        },
                                        color: Colors.transparent,
                                        borderColor: Colors.white,

                                        // width: MediaQuery.of(context).size.width*0.772,
                                        child: Text(
                                          "sidebartext7".tr,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall),
                                          textAlign: (language == 'Urdu' ||
                                                  language == 'Arabic')
                                              ? TextAlign.end
                                              : TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.05,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: AdWidget(
                                ad: AdMobHelper.getBannerAd()..load(),
                                key: UniqueKey(),
                              ),
                              height: 92,
                              width: Get.width * 1.4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
