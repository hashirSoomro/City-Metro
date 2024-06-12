import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:world_metro/data/hotelData.dart';
import 'package:world_metro/view/home/homeView.dart';
import 'package:world_metro/view/initializer/initializer1.dart';

import '../../component/constant.dart';
import '../CityProvider/CityProvider.dart';

class WorldMapView extends StatefulWidget {
  const WorldMapView({super.key});

  @override
  State<WorldMapView> createState() => _WorldMapViewState();
}

class _WorldMapViewState extends State<WorldMapView> {
  @override
  Widget build(BuildContext context) {
    CityProvider cities = Provider.of<CityProvider>(context);
    // EventData city = Provider.of<EventData>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    Get.to(Initializer1());
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
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
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text("Selectcity".tr,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          height: 2))),
            ),
            // Text(
            //   "Lorem ipsum dolor sit amet consectetur. Blandit ut id arcu felis. In dolor proin laoreet diam.",
            //   style: GoogleFonts.openSans(
            //       textStyle: TextStyle(
            //           color: ConstantColor.lightgrey,
            //           fontSize: 14,
            //           fontWeight: FontWeight.w400)),
            // ),
            // SizedBox(height: 20,),
            Expanded(
                child: Container(
                  width: 400,
                  child: GridView.builder(
                              itemCount: cities.Cities.length,
                             gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                              itemBuilder: (context, index) {
                  String city = cities.Cities[index];
                  // String? link= cities.Cities[index]['link'];
                  return GestureDetector(
                    onTap: () {
                      cities.selectCity(city);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    },
                    child: Container(
                      // height: 40,
                      // width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage('assets/${city}.jpg'),
                            fit: BoxFit.contain),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              top: 120,
                              left: 25,
                              child: Text(
                                "${city}",
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ))
                        ],
                      ),
                    ),
                  );
                              },
                            ),
                ))
          ],
        ),
      ),
    );
  }
}
