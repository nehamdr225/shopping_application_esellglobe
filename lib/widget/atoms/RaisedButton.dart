import 'package:flutter/material.dart';

class FRaisedButton extends StatelessWidget {
  final String text;
  final height;
  final width;
  final Function onPressed;
  final Color color, bg;
  final shape;
  final needIcon;
  final image;
  final imgcolor;
  final elevation;
  FRaisedButton(
      {this.text,
      this.shape,
      this.onPressed,
      this.color,
      this.bg,
      this.width,
      this.height,
      this.elevation,
      this.image,
      this.imgcolor,
      this.needIcon: false});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        elevation: elevation,
          color: bg,
          child: needIcon == true
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    image,
                    height: 25.0,
                    width: 25.0,
                    color: imgcolor,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontFamily: 'Helvetica',
                      fontSize: 16.0,
                    ),
                  ),
                ])
              : Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontFamily: 'Helvetica',
                    fontSize: 18.0,
                  ),
                ),
          shape: shape != null
              ? Border.all(width: 0.0, color: Colors.black38)
              : const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
          onPressed: onPressed),
    );
  }
}
