import 'package:bangkok_metro/view/Event/widget/show_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../component/constant.dart';


class MyTextField extends StatelessWidget {
  var hintText;

  var controller;

  var obsecureText;

  MyTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obsecureText = false,
    // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obsecureText,
        cursorColor: ConstantColor.blue,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: () {
                showModalBottomSheet(
                   shape: const RoundedRectangleBorder(
                           borderRadius: BorderRadius.vertical(
                           top: Radius.circular(20))),
                    context: context,
                    builder: (context) {
                      return ShowModalBottom();
                    });
              },
              child: Image.asset("assets/filter.png")),
          prefixIcon: Image.asset("assets/search.png"),
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            textStyle: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: ConstantColor.blue, fontSize: 14),
            decorationColor: ConstantColor.blue,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE9F1FF))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ConstantColor.blue,
            ),
          ),
        ),
        style: GoogleFonts.poppins(
          textStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: ConstantColor.blue, fontSize: 14),
          decorationColor: ConstantColor.blue,
        ));
  }
}
