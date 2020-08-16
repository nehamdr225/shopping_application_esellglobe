import 'package:flutter/material.dart';

class FOutlineButton extends StatelessWidget {
  final double height, width, radius;
  final String text;
  // final TextStyle textStyle;
  final Function onPressed;
  final Color color;
  FOutlineButton({this.onPressed, this.color, this.height, this.width, this.radius, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlineButton(
        child: Text(text, style: Theme.of(context).textTheme.headline5.copyWith(color: color)),//.copyWith(color: color),),
        textColor: color,
        borderSide: BorderSide(color: color,),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}