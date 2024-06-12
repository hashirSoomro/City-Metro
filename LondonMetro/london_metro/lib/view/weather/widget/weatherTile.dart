import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherTile extends StatelessWidget {
  final String icon;
  final String day;
  final String weatherType;
  final String tempF;
  final String tempC;
  const WeatherTile({
    Key? key,
    required this.icon,
    required this.day,
    required this.weatherType,
    required this.tempF,
    required this.tempC,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 10,
      margin: EdgeInsets.only(top: 5, right: 3, left: 3, bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(icon),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      day,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          height: 0.7,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3F403F),
                        ),
                      ),
                    ),
                    Text(
                      weatherType.toString().capitalize ?? "",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF3F403F),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      tempF + "°F",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          height: 0.7,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3F403F),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 20,
                    ),
                    Text(
                      tempC + "°C",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFCACACA),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
