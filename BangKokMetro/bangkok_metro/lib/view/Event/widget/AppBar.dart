import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../component/constant.dart';
import '../../initializer/initializer.dart';


class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Initializer(),
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                color: const Color(0xFFFFFFFF),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  )
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back_ios_new_outlined,color:  ConstantColor.blue,),
              ),
            )),
            SizedBox(width: 60,),
        Text(
          "Things To Do",
          style: GoogleFonts.montserrat(
              textStyle: Theme.of(context).textTheme.bodySmall),
        ),
       
      ],
    );
  }
}
