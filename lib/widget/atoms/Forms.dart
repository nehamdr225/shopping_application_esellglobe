import 'package:flutter/material.dart';
import '../../widget/colors.dart';

class FForms extends StatelessWidget {
  final bool obscure;
  final String text;
  final TextInputType type;
  final style = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      color: Colors.grey);
  FForms({this.text, this.type, this.obscure: false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      autofocus: false,
      obscureText: obscure,
      decoration: InputDecoration(
          icon: type == TextInputType.phone ? Icon(Icons.call) : null,
          contentPadding: type == TextInputType.phone
              ? EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
              : null,
          labelText: text,
          labelStyle: style,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primarycolor))),
    );
  }
}
