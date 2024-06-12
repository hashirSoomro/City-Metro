import 'dart:math';

import 'package:beijing_subway/view/Event/widget/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../adMobHelper/adMobHelper.dart';
import '../../../component/constant.dart';
import '../../../data/hotelData.dart';

class MyListView2 extends StatefulWidget {
  const MyListView2({super.key});

  @override
  State<MyListView2> createState() => _MyListView2State();
}

class _MyListView2State extends State<MyListView2> {
  Future<void> _launchUrl(url) async {
    if (await launchUrl(
      url,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  final eventDatas = List.from(EventData.events);
  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: eventDatas.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
                onTap: () {
                  // Get.to(DetailHotel());
                  _launchUrl(Uri.parse("${eventDatas[index]['web_url']}"));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Stack(
                    children: [
                      Container(
                        height: 164,
                        width: 370,
                        child: Card(
                          shadowColor: Color.fromRGBO(0, 0, 0, 0.4),
                          elevation: 9,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust the radius as needed

                            // side: BorderSide(color: Colors.grey, width: 1.0), // Border color and width
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 10),
                                  child: Container(
                                    height: 140,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${eventDatas[index]['image_url']}"),
                                            fit: BoxFit.cover)),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  // width: 130,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 210,
                                          child: Text(
                                            "${eventDatas[index]['short_title']}",
                                            style: GoogleFonts.montserrat(
                                              textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: ConstantColor.lightgrey,
                                              ),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                        ),

                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                MyRatingBar(
                                                  rating: eventDatas[index]
                                                      ["rating"],
                                                  size: 20,
                                                ),
                                                Text(
                                                  "(${eventDatas[index]['review_count']})",
                                                  style: GoogleFonts.montserrat(
                                                    textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: ConstantColor.grey,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              " ${eventDatas[index]['duration']}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: ConstantColor.blue,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        //  SizedBox(width: 10,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 20,
                          right: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                'From',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ConstantColor.lightgrey,
                                  ),
                                ),
                              ),
                              Text(
                                "${eventDatas[index]['currency_code']} ${eventDatas[index]['price']}",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(1, 109, 181, 1),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                )),
          ],
        );
      },
    );
  }
}
