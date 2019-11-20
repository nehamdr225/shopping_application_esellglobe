import 'package:flutter/material.dart';

const primary = Color(0xff78daff);
//const bgcolor = Color(0xffe5f3ff);
const bgcolor = Color(0xffEEEEEE);
const iconcolor= Color(0xff78ff9c);
const secondary = Color(0xffffa378);
const errorColor = const Color(0xffc5032b);
const splash = Colors.black12;
const textColor = Colors.black87; 

class FTheme with ChangeNotifier {
  ThemeData esellDarkTheme = ThemeData.dark();

  ThemeData esellDefaultTheme = ThemeData(
    canvasColor: Colors.transparent,
    fontFamily: 'Montserrat',
    textSelectionColor: Colors.black38,
    textTheme: TextTheme( 
        headline: TextStyle(fontSize: 24.0, color: textColor),
        title: TextStyle(fontSize: 18.0, color: textColor),
        body1: TextStyle(fontSize: 12.0, color: textColor),
        body2: TextStyle(fontSize: 18.0, color: primary),
        caption: TextStyle(fontSize: 14.0, color: textColor),
    ),
  );

  ThemeData _themeData;
  bool isDark = false;

  FTheme() {
    _themeData = esellDefaultTheme;
  }

  ThemeData getTheme() => _themeData;

  setTheme() {
    if (!isDark) {
      _themeData = esellDarkTheme;
    } else {
      _themeData = esellDefaultTheme;
    }

    isDark = !isDark;
    notifyListeners();
  }
}
