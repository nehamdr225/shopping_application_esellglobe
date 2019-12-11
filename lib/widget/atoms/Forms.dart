import 'package:flutter/material.dart';

class FForms extends StatelessWidget {
  final bool obscure;
  final String text;
  final Icon icon;
  final TextInputType type;
  final Function onChanged;
  final height;
  final underline;
  final style = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.grey[400]);
  FForms({
    this.text,
    this.height,
    this.type,
    this.obscure: false,
    this.onChanged,
    this.icon,
    this.underline: false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      autofocus: false,
      obscureText: obscure,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        )),
        prefixIcon: icon,
        hintText: text,
        labelStyle: style,
        labelText: text,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primaryVariant,
        )),
        focusedBorder: underline == false
            ? OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary))
            : UnderlineInputBorder(
                borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primaryVariant,
              )),
      ),
    );
  }
}
