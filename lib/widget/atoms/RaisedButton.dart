import 'package:flutter/material.dart';

class FRaisedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, bg;
  FRaisedButton(
      {this.text,
      this.onPressed,
      this.color,
      this.bg});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 50,
      child: RaisedButton(
          color: bg,
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontFamily: 'Victorian',
              fontSize: 25.0,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          onPressed: onPressed),
    );
  }
}
