import 'package:flutter/material.dart';

class CustomTextStyle extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight font;
  final Color color;
  final double spacing;

  CustomTextStyle({this.text, this.size, this.font, this.color, this.spacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: font,
        color: color,
        letterSpacing: spacing,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
