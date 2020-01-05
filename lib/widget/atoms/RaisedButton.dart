import 'package:flutter/material.dart';

class FRaisedButton extends StatelessWidget {
  final String text;
  final fontSize;
  final fontWeight;
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
      this.fontSize: 18.0,
      this.fontWeight,
      this.shape: false,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: color, fontWeight: fontWeight),
                      ),
                    ])
              : Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
                ),
          shape: shape == false
              ? Border.all(
                  width: 0.0, color: Theme.of(context).colorScheme.background)
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
          onPressed: onPressed),
    );
  }
}
