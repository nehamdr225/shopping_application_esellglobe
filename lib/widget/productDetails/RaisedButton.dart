import 'package:flutter/material.dart';

class PDRbutton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  PDRbutton({this.onPressed, this.text, this.color});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
          minWidth: 165.0,
          height: 45.0,
          child: RaisedButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            onPressed: onPressed,
            child: Text(text,
                style: TextStyle(
                    fontFamily: 'Victorian',
                    fontSize: 26.0,
                    color: color)),
          ),
        );
  }
}