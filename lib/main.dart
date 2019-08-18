import 'package:EsellGlobe/pages/Home.dart';
import 'package:flutter/material.dart';

import './pages/UserPromt.dart';
import 'package:EsellGlobe/store/Store.dart';

void main() async {
  var token = await getValue("token");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Ropa Sans',
      textSelectionColor: Colors.black38,
      textTheme: TextTheme(
          headline: TextStyle(fontSize: 24.0, color: Colors.black38),
          title: TextStyle(fontSize: 18.0, color: Colors.black87),
          body1: TextStyle(fontSize: 12.0),
          body2: TextStyle(
            fontSize: 18.0,
          ),
          caption: TextStyle(fontSize: 14.0, color: Colors.black87)),
    ),
    home: token != null ? HomePageApp() : UserPromptApp(),
  ));
}
