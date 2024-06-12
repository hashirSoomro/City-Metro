import 'package:flutter/material.dart';

class MyRatingBar extends StatelessWidget {
  final dynamic rating;
  final double size;
  final Color color;

  const MyRatingBar({
    Key? key,
    required this.rating,
    this.size = 24.0,
    this.color = Colors.amber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        
        if (index < rating) {
          return Icon(
            Icons.star,
            size: size,
            color: color,
          );
        } else {
          return Icon(
            Icons.star_border,
            size: size,
            color: color,
          );
        }
      }),
    );
  }
}
