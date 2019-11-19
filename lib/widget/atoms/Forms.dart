import 'package:esell/state/state.dart';
import 'package:flutter/material.dart';
import 'package:esell/state/src/theme.dart';

class FForms extends StatelessWidget {
  final bool obscure;
  final String text;
  final TextInputType type;
  final Function onChanged;
  final style = TextStyle(
      fontFamily: 'Ropa Sans',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black54);
  FForms({this.text, this.type, this.obscure: false, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      autofocus: false,
      obscureText: obscure,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primary,)
        ),
          icon: type == TextInputType.phone ? Icon(Icons.call) : null,
          contentPadding: type == TextInputType.phone
              ? EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
              : null,
          hintText: text,
          labelStyle: style,
          labelText: text,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary))
      ),
    );
  }
}
