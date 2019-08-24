import 'package:flutter/material.dart';

class FText extends StatelessWidget {
  final String text;
  final String family;
  final double size;
  final Color color;
  final TextStyle style;
  FText(
      {this.text,
      this.family: 'Victorian',
      this.size: 32.0,
      this.color: Colors.black,
      this.style});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style != null
          ? style
          : TextStyle(fontFamily: family, fontSize: size, color: color),
    );
  }
}
