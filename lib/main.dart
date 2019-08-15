import 'package:flutter/material.dart';

import './pages/UserPromt.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Ropa Sans',
      textSelectionColor: Colors.black38,
      textTheme: TextTheme(
          headline: TextStyle(fontSize: 24.0, color: Colors.black38),
          title: TextStyle(fontSize: 14.0, color: Colors.black38),
          body1: TextStyle(fontSize: 12.0),
          body2: TextStyle(
            fontSize: 18.0,
          ),
          caption: TextStyle(fontSize: 12.0, color: Colors.grey[400])),
    ),
    home: UserPromptApp(),
  ));
}
