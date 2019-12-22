import 'package:flutter/material.dart';

buildAndShowSnackBar(context, content) {
  final snack = SnackBar(content: content);
  Scaffold.of(context).showSnackBar(snack);
}
