import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../component/constant.dart';


class ShowModalBottom extends StatefulWidget {
  const ShowModalBottom({super.key});

  @override
  State<ShowModalBottom> createState() => _ShowModalBottomState();
}

class _ShowModalBottomState extends State<ShowModalBottom> {
  RangeValues values = const RangeValues(400, 1600);
  int activeTab = 1;
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // height: 800,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset("assets/line2.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Filter/sort",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color:  ConstantColor.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/Line.png",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Price",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ConstantColor.lightgrey
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 33,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9F1FF)),
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "\$${values.start.toString()}",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ConstantColor.lightgrey
                              // height: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 33,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE9F1FF)),
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "\$${values.end.toString()}",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ConstantColor.lightgrey
                              // height: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: RangeSlider(
                  activeColor: ConstantColor.blue,
                  values: values,
                  onChanged: (RangeValues newValues) {
                    setState(() {
                      values = newValues;
                    });
                  },
                  min: 0,
                  max: 2000,
                  divisions: 100,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Popular",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ConstantColor.grey,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          selectedOption = 0;
                        });
                      },
                      icon: selectedOption==0
                       ?Icon(Icons.radio_button_checked,color: ConstantColor.blue,) 
                       :Icon(Icons.radio_button_off,color:ConstantColor.blue))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lowest Price",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ConstantColor.grey,
                      ),
                    ),
                  ),
                   IconButton(
                      onPressed: () {
                        setState(() {
                          selectedOption = 1;
                        });
                      },
                      icon: selectedOption==1
                       ?Icon(Icons.radio_button_checked,color: ConstantColor.blue,) 
                       :Icon(Icons.radio_button_off,color:ConstantColor.blue))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        activeTab = 0;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: (activeTab == 0)
                              ? ConstantColor.blue
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            color: ConstantColor.blue,
                          )),
                      child: Center(
                        child: Text(
                          "Reset",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: (activeTab == 0)
                                  ? Colors.white
                                  : ConstantColor.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        activeTab = 1;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: (activeTab == 1)
                              ? ConstantColor.blue
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            color: ConstantColor.blue,
                          )),
                      child: Center(
                        child: Text(
                          "Apply",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: (activeTab == 1)
                                  ? Colors.white
                                  : ConstantColor.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




//  Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         print("Reset");
//                         activeTab = 1;
//                       });
//                     },
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       child: MyButton(
                        // color: (activeTab == 1)
                        //     ? ConstantColor.blue
                        //     : Colors.white,
//                         onPressed: () {},
                        // borderColor: (activeTab == 1)
                        //     ? Colors.white
                        //     : ConstantColor.blue,
//                         height: 35,
                        // child: Text(
                        //   "Reset",
                        //   style: GoogleFonts.montserrat(
                        //     textStyle: TextStyle(
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w500,
                        //       color: (activeTab == 1)
                        //           ? Colors.white
                        //           : ConstantColor.blue,
                        //     ),
                        //   ),
                        // ),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         print("apply");
//                         activeTab = 0;
//                       });
//                     },
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       child: MyButton(
//                         color: (activeTab == 0)
//                             ? ConstantColor.blue
//                             : Colors.white,
//                         onPressed: () {},
//                         borderColor: (activeTab == 0)
//                             ? Colors.white
//                             : ConstantColor.blue,
//                         height: 35,
//                         child: Text(
//                           "Apply",
//                           style: GoogleFonts.montserrat(
//                             textStyle: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               color: (activeTab == 0)
//                                   ? Colors.white
//                                   : ConstantColor.blue,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )