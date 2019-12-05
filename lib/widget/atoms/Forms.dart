import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';


class FForms extends StatelessWidget {
  final bool obscure;
  final String text;
  final TextInputType type;
  final Function onChanged;
  final underline;
  final style = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.grey[400]);
  FForms({this.text, this.type, this.obscure: false, this.onChanged, this.underline:false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      autofocus: false,
      obscureText: obscure,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,)
        ),
          icon: type == TextInputType.phone 
            ? Icon(Icons.call, color: primary,) 
            : type == TextInputType.emailAddress
              ? Icon(Icons.email, color: primary)
              : null,
          contentPadding: type == TextInputType.phone
              ? EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
              : null,
          hintText: text,
          labelStyle: style,
          labelText: text,
          enabledBorder: 
          underline == false 
          ? OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryVariant,
            )):
            UnderlineInputBorder(
              borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryVariant,)
            ),
          focusedBorder: 
          underline == false
            ? OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary))
            : UnderlineInputBorder(
              borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryVariant,)
            ),
      ),
    );
  }
}
