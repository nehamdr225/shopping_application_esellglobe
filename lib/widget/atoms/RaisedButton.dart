import 'package:flutter/material.dart';

class FRaisedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  FRaisedButton({this.text, this.onPressed, this.color: Colors.deepPurple});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: RaisedButton(
          color: Colors.white,
          child: Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
              child: Text(
                text,
                style: TextStyle(
                  color: color,
                  fontFamily: 'Victorian',
                  fontSize: 25.0,
                ),
              )),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          onPressed: onPressed),
    );
  }
}
