import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../component/constant.dart';
import '../../../getLanguage/getLanguage.dart';
import '../../Event/event.dart';
import '../homeView.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Uri url = Uri.parse(
      "https://callstomailbox.blogspot.com/2023/01/guangzhou-metro-map-hotels-attractions.html");
  Future<void> _launchUrl(url) async {
    if (await launchUrl(
      url,mode:LaunchMode.inAppWebView
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
        backgroundColor: Colors.white,
        width: MediaQuery.of(context).size.width*0.7,
        child: ListView(
          padding: EdgeInsets.all(12),
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/logo.jpg'), // Replace with your logo image path
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                 Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
    
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(width: 5,),
                    
                    SvgPicture.asset("assets/train_vector.svg"),
                    // SizedBox(width: 15,),
                    Container(
                      width: 140,
                      child: Text("sidebartext1".tr,
                                     style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      // color: ConstantColor.blue,
                                      ),
                                    ),
                                    ),
                    ),
                // SizedBox(width: 40,),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: ConstantColor.blue,
                    )),
              

                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                 Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EventView(),
                        ),
                      );
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    
                    SvgPicture.asset("assets/event_vector.svg"),
                    
                    Container(
                      width: 140,
                      child: Text("sidebartext3".tr,
                                     style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      // color: ConstantColor.blue,
                                      ),
                                    ),
                                    ),
                    ),
                    
                // SizedBox(width: 40,),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EventView(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: ConstantColor.blue,
                    )),
              

                  ],
                ),
              ),
              

              // child: ListTile(
              //   leading: SvgPicture.asset("assets/event_vector.svg"),
              //   title:  Text("Thins To Do",
              //    style: GoogleFonts.montserrat(
              //     textStyle: const TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500,
              //       // color: ConstantColor.blue,
              //     ),
              //   ),
              //   ),
              //   trailing: IconButton(
              //       onPressed: () {
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const EventView(),
              //           ),
              //         );
              //       },
              //       icon: const Icon(
              //         Icons.arrow_forward_ios_outlined,
              //         color: ConstantColor.blue,
              //       )),
              // ),
            ),
            SizedBox(height: 10,),
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
                          icon:Icon(Icons.arrow_drop_down_outlined,
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
                        'English',
                        'Chinese',
                        'Urdu',
                        'Hindi',
                        'Arabic',
                        'Russian',
                        'Spanish'
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        );
                          }).toList(),
                        ),
                      ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
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
                 SizedBox(width: 9,),
                  Text(
                    "PrivatePolicy".tr,
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                      color: ConstantColor.grey,
                      fontSize: 14


                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
