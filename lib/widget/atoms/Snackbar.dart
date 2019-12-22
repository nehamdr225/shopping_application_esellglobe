import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';

buildAndShowSnackBar(context, content) {
  final snack = SnackBar(
    content: Text(content,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
    backgroundColor: primaryDark,
    behavior: SnackBarBehavior.floating,
    elevation: 6.0,
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {
        Scaffold.of(context).hideCurrentSnackBar();
      },
    ),
  );
  Scaffold.of(context).showSnackBar(snack);
}
