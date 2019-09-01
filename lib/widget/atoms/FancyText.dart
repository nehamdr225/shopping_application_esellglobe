import 'package:flutter/material.dart';

class FancyText extends StatelessWidget {
  final String text;
  final double size;
  final Function onTap;
  final TextDecoration decoration;

  FancyText({this.text, this.size, this.onTap, this.decoration});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Text(text,
              style: TextStyle(
                  fontFamily: 'Ropa Sans',
                  fontSize: size,
                  color: Colors.deepPurple[900],
                  decoration: decoration != null? TextDecoration.underline:TextDecoration.none,
                  decorationColor: Colors.deepPurple[900])),
        ),
      ),
    );
  }
}
