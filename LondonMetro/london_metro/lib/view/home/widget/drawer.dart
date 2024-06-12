import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../component/constant.dart';
import '../../../getLanguage/getLanguage.dart';
import '../../About/about.dart';
import '../../Contact/contactUs.dart';
import '../../Event/event.dart';
import '../../global-constants.dart';
import '../../weather/weather.dart';
import '../homeView.dart';
import 'drawertile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Uri url = Uri.parse(private_policy);
  // Future<void> _launchUrl(url) async {
  //   if (await launchUrl(url, mode: LaunchMode.inAppWebView)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }
  String hotelUri = hotel_uri;
  Future<void> _launchUrl(url) async {
    if (await launchUrl(
      url,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider selectedLanguage = Provider.of<LanguageProvider>(context);
    String language = selectedLanguage.selectedLanguage;
    return SizedBox(
      // height: MediaQuery.of(context).size.height*0.8,
      child: Drawer(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        width: MediaQuery.of(context).size.width * 0.7,
        child: ListView(
          padding: EdgeInsets.all(12),
          children: <Widget>[
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                              drawer_logo), // Replace with your logo image path
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              child: DrawerTile(
                route: "assets/train_vector.svg",
                text: "sidebartext1",
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EventView(),
                    ),
                  );
                },
                child: DrawerTile(
                  route: "assets/things_to_do_vector.svg",
                  text: "sidebartext3",
                )),
            // InkWell(
            //     onTap: () {
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const EventView(),
            //         ),
            //       );
            //     },
            //     child: DrawerTile(
            //       route: "assets/event_vector.svg",
            //       text: "sidebartext2",
            //     )),
            InkWell(
              onTap: () {
                _launchUrl(Uri.parse(hotelUri));
              },
              child: DrawerTile(
                route: "assets/hotel_vector.svg",
                text: "sidebartext4",
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyWeather(),
                  ),
                );
              },
              child: DrawerTile(
                route: "assets/cloud.svg",
                text: "sidebartext5",
              ),
            ),
            Divider(),
            InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const About(),
                    ),
                  );
                },
                child: DrawerTile(
                  route: "assets/about.svg",
                  text: "sidebartext6",
                )),
            InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUs(),
                    ),
                  );
                },
                child: DrawerTile(
                  route: "assets/contact.svg",
                  text: "sidebartext7",
                )),
            // Divider(),
            // InkWell(
            //   onTap: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const EventView(),
            //       ),
            //     );
            //   },
            //   child: DrawerTile(
            //     route: "assets/insta.svg",
            //     text: "sidebartext8",
            //   ),
            // ),
            // InkWell(
            //     onTap: () {
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const EventView(),
            //         ),
            //       );
            //     },
            //     child:
            //         DrawerTile(route: "assets/fb.svg", text: "sidebartext9")),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 50,
              height: 44,
              decoration: BoxDecoration(
                  color: Color(0xFFEFFAFF),
                  borderRadius: BorderRadius.circular(6)),
              child: DropdownButton<String>(
                // alignment: Alignment.centerRight,
                isExpanded: true,
                style: TextStyle(),
                autofocus: false,
                borderRadius: BorderRadius.circular(6),
                underline: Container(),
                icon: Icon(
                  Icons.arrow_drop_down_outlined,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          //   Container(
                          //     height: 50,
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(image: SvgPicture.network("url"))
                          //     ),
                          //     child: SvgPicture.network("flag".tr)),
                          Text(
                            countries,
                            style: GoogleFonts.montserrat(
                                color: ConstantColor.blue,
                                textStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  _launchUrl(url);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/shield.svg"),
                    SizedBox(
                      width: 9,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "PrivatePolicy".tr,
                        style: GoogleFonts.montserrat(
                          color: ConstantColor.grey,
                          fontSize: 12,
                        ),
                      ),
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis, // Or TextOverflow.visible
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
