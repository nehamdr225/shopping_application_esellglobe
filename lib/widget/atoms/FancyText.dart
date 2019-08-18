import 'package:flutter/material.dart';

class FancyText extends StatelessWidget {
  final String text;
  final double size;
  final Function onTap;

  FancyText({this.text, this.size, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Text(text,
            style: TextStyle(
                fontFamily: 'Ropa Sans',
                fontSize: size,
                color: Colors.deepPurple[900],
                decoration: TextDecoration.underline,
                decorationColor: Colors.deepPurple[900])),
      ),
    );
  }
}
