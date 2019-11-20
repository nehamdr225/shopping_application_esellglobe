import 'package:flutter/material.dart';

class FancyText extends StatelessWidget {
  final String text;
  final double size;
  final Function onTap;
  final TextDecoration decoration;
  final Color color;
  final fontfamily;
  final TextAlign textAlign;

  FancyText(
      {this.text,
      this.color,
      this.fontfamily: 'Montserrat',
      this.size,
      this.onTap,
      this.decoration,
      this.textAlign: TextAlign.center});
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 30.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Text(text,
              textAlign: textAlign,
              style: TextStyle(
                  fontFamily: fontfamily,
                  fontSize: size,
                  color: color,
                  decoration: decoration != null
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationColor: Colors.deepPurple[900])),
        ),
      ),
    );
  }
}
