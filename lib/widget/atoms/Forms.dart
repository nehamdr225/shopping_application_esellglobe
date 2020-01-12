import 'package:flutter/material.dart';

class FForms extends StatelessWidget {
  final bool obscure;
  final String text;
  final icon;
  final prefix;
  final TextInputType type;
  final Function onChanged;
  final height;
  final width;
  final underline;
  final style = TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.grey[400]);
  FForms({
    this.text,
    this.height,
    this.width,
    this.type,
    this.obscure: false,
    this.onChanged,
    this.icon,
    this.prefix,
    this.underline: false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
          child: TextField(
        keyboardType: type,
        autofocus: false,
        obscureText: obscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          )),
          prefix: prefix,
          prefixIcon: icon,
          hintText: text,
          labelStyle: style,
          labelText: text,
          enabledBorder: underline == false
              ? OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary))
              : UnderlineInputBorder(
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
      ),
    );
  }
}
