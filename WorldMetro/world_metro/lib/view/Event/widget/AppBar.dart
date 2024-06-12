import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_metro/view/Event/widget/show_modal.dart';

import '../../../component/constant.dart';


// class MyAppBar extends StatelessWidget {
//   const MyAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
          // GestureDetector(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Container(
          //       decoration: const BoxDecoration(
          //         color: const Color(0xFFFFFFFF),
          //         shape: BoxShape.circle,
          //         boxShadow: [
          //           BoxShadow(
          //             blurRadius: 5,
          //             color: Color.fromRGBO(0, 0, 0, 0.1),
          //           )
          //         ],
          //       ),
          //       child: const CircleAvatar(
          //         backgroundColor: Colors.white,
          //         child: Icon(
          //           Icons.arrow_back_ios_new_outlined,
          //           color: ConstantColor.blue,
          //         ),
          //       ),
          //     )),
//           // SizedBox(width: 90,),
//           Center(
//             child: Text(
//               "Heading1".tr,
//               style: GoogleFonts.montserrat(
//                   textStyle: Theme.of(context).textTheme.bodySmall),
//             ),
//           ),
          
//           //  GestureDetector(
//           //    onTap: (){
//           //   showModalBottomSheet(
//           //            shape: const RoundedRectangleBorder(
//           //                    borderRadius: BorderRadius.vertical(
//           //                    top: Radius.circular(20))),
//           //             context: context,
//           //             builder: (context) {
//           //               return ShowModalBottom();
//           //             });
//           // },
//           //     child: Container(
//           //       decoration: const BoxDecoration(
//           //         color: const Color(0xFFFFFFFF),
//           //         shape: BoxShape.circle,
//           //         boxShadow: [
//           //           BoxShadow(
//           //             blurRadius: 5,
//           //             color: Color.fromRGBO(0, 0, 0, 0.1),
//           //           )
//           //         ],
//           //       ),
//           //       child:  CircleAvatar(
//           //         backgroundColor: Colors.white,
//           //         child: SvgPicture.asset("assets/filter.svg",height: 30,)
//           //       ),
//           //     )),
//         ],
//       ),
//     );
//   }
// }
class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      
    );
  }
}