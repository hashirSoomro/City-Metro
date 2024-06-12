import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/constant.dart';
import '../initializer/initializer2.dart';

class MyAppBar extends StatefulWidget {
  final String heading;
  const MyAppBar({
    Key? key,
    required this.heading,
  }) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.menu,
                    color: Colors.blue, // replace with your ConstantColor.blue
                  ),
                ),
              ),
            );
          }),
        )
      ],
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            onTap: () {
              Get.to(Initializer2());
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3),
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
      title: Center(
        child: Text(
          widget.heading.tr,
          style: GoogleFonts.montserrat(
              textStyle: Theme.of(context).textTheme.bodySmall),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
    );
  }
}
