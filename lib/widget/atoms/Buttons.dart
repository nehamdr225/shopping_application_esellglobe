import 'package:flutter/material.dart';

class FButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  FButton({this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150.0,
        height: 50.0,
        child: RaisedButton(
          color: Colors.deepPurple[900],
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              // fontFamily: 'Roboto',
              fontSize: 24.0,
            ),
          ),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          onPressed: onPressed,
        ));
  }
}
