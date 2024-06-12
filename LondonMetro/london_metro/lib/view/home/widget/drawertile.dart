import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../component/constant.dart';

class DrawerTile extends StatefulWidget {
  final route;
  final String text;
  const DrawerTile({
    Key? key,
    required this.route,
    required this.text,
  }) : super(key: key);

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(widget.route),
          Container(
            width: 140,
            child: Text(
              widget.text.tr,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  // color: ConstantColor.blue,
                ),
              ),
            ),
          ),
          Icon(
            size: Get.height / 35,
            Icons.arrow_forward_ios_outlined,
            color: ConstantColor.blue,
          ),
        ],
      ),
    );
  }
}
