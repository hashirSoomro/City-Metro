import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final color;
  final borderColor;
  // final double width;
  final double height;

  const MyButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.color,
    this.borderColor = Colors.transparent,
    // this.width = 371.0, // Default width
    this.height = 45, // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          width: 1.0,
          color: borderColor,
        ),
        backgroundColor: color,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
        // Set width and height
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width / 2.5,
        height: height, // Set height
        alignment: Alignment.center,
        child: Center(child: child),
      ),
    );
  }
}
