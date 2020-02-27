import 'package:flutter/material.dart';

class FText extends StatelessWidget {
  final String text;
  final String family;
  final double size;
  final fontWeight;
  final Color color;
  final TextStyle style;
  final List padding;
  final TextAlign align;
  FText(
      {this.text,
      this.family: 'Montserrat',
      this.fontWeight,
      this.size: 32.0,
      this.color: Colors.black,
      this.style,
      this.align,
      this.padding: const [8.0, 12.0]});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: padding[0],
            bottom: padding[0],
            left: padding[1],
            right: padding[1]),
        child: Text(
          text,
          textAlign: align,
          style: style != null
              ? style
              : TextStyle(fontFamily: family, fontSize: size, color: color, fontWeight: fontWeight),
        ));
  }
}
