import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../component/constant.dart';
import '../eventModel.dart';
import '../eventServices.dart';
import 'rating_widget.dart';

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

  late Future<List<MyEvent>> eventDatas;

  @override
  void initState() {
    super.initState();
    eventDatas = EventService().fetchEvents();
  }

  //final eventDatas = List.from(EventData.events);
  //final eventDatas = EventServices().fetchEventData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MyEvent>>(
        future: eventDatas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Color(0xFF018FD7),
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No events available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final event = snapshot.data![index];
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 4, left: 2, right: 2),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          // Get.to(DetailHotel());
                          //"${eventDatas[index]['web_url']}"
                          _launchUrl(Uri.parse(event.web_url));
                        },
                        child: Stack(
                          children: [
                            Material(
                              shadowColor: Color.fromRGBO(0, 0, 0, 0.4),
                              color: Colors.white,
                              surfaceTintColor: Colors.white,
                              elevation: 15,
                              borderRadius: BorderRadius.circular(12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                height: 140,
                                width: Get.width * 0.96,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 8, top: 5),
                                        child: Container(
                                          height: 130,
                                          width: 110,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  //"${eventDatas[index]['image_url']}"
                                                  image: NetworkImage(
                                                      event.image_url),
                                                  fit: BoxFit.cover)),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        // width: 130,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.565,
                                                    //"${eventDatas[index]['short_title']}"
                                                    child: Text(
                                                      event.short_title,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        textStyle:
                                                            const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: ConstantColor
                                                              .lightgrey,
                                                        ),
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: Get.width * 0.01),
                                                  // InkWell(
                                                  //   borderRadius:
                                                  //       BorderRadius.circular(
                                                  //           15),
                                                  //   onTap: () {
                                                  //     Share.share(
                                                  //         event.web_url);
                                                  //   },
                                                  //   child: CircleAvatar(
                                                  //     backgroundColor:
                                                  //         Colors.white,
                                                  //     foregroundColor:
                                                  //         Colors.white,
                                                  //     radius: 16,
                                                  //     child: SvgPicture.asset(
                                                  //         "assets/share.svg"),
                                                  //   ),
                                                  // ),
                                                ],
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
                                                        rating: event.rating,
                                                        size: 20,
                                                      ),
                                                      Text(
                                                        "${event.review_count}",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          textStyle:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: ConstantColor
                                                                .grey,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    event.duration,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            ConstantColor.blue,
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
                                bottom: 10,
                                right: 16,
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
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: ConstantColor.lightgrey,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${event.currency_code} ${event.price}",
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
                      ),
                    ),
                  ],
                );
              },
            );
          }
        });
  }
}
