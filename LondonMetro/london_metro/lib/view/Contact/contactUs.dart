import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:london_metro/component/constant.dart';
import '../../adMobHelper/adMobHelper.dart';
import '../AllWidgets/appBar.dart';
import '../home/widget/drawer.dart';
import 'contactModel.dart';

class ContactUs extends StatefulWidget {
  //ContactModel contactModel;
  ContactUs({
    super.key,
    //required this.contactModel,
  });

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool _isContainerVisible = false;

  void _toggleContainer() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(
          heading: "Heading5",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'ContactText'.tr,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1F1F1F),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 20,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 15,
                right: 15,
              ),
              decoration: BoxDecoration(
                  color: Color(0xFFEFFAFF),
                  border: Border.all(
                    color: Color(0xFF018FD7),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              height: Get.height / 13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/sms-edit.svg"),
                      SizedBox(
                        width: Get.width / 28,
                      ),
                      Text(
                        "ContactTile1".tr,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            // color: ConstantColor.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(17),
                    onTap: _toggleContainer,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      child: SvgPicture.asset("assets/dropdown.svg"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            if (_isContainerVisible)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    cursorColor: ConstantColor.blue,
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    decoration: InputDecoration(
                      hoverColor: Color(0xFF018FD7),
                      focusColor: Color(0xFF018FD7),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20, // Increase horizontal padding
                        vertical: 15, // Increase vertical padding
                      ),
                      hintText: "Enter your email",
                      hintStyle: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          // color: ConstantColor.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF018FD7),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF018FD7),
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ConstantColor.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  TextFormField(
                    maxLines: 5,
                    cursorColor: ConstantColor.blue,
                    textInputAction: TextInputAction.next,
                    controller: messageController,
                    decoration: InputDecoration(
                      hoverColor: Color(0xFF018FD7),
                      focusColor: Color(0xFF018FD7),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20, // Increase horizontal padding
                        vertical: 15, // Increase vertical padding
                      ),
                      hintText: "Enter your message",
                      hintStyle: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          // color: ConstantColor.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF018FD7),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF018FD7),
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ConstantColor.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF018FD7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        ContactModel contactModel = ContactModel(
                            email: emailController.text.trim(),
                            message: messageController.text.trim());
                        await FirebaseFirestore.instance
                            .collection('contact')
                            .doc(emailController.toString())
                            .set(contactModel.toMap());
                        emailController.clear();
                        messageController.clear();
                      } catch (e) {
                        print("Error:$e");
                      }
                    },
                    child: Text("Send"),
                  )
                ],
              ),
          ]),
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: AdWidget(
          ad: AdMobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
        height: 92,
        width: MediaQuery.of(context).size.width * 1.1,
      ),
    );
  }
}
