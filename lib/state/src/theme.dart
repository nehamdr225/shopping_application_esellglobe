import 'package:flutter/material.dart';

const primary = Color(0xff78daff);
const primaryDark = Color(0xff3ea8cc);
const bgcolor = Color(0xffEEEEEE);
const iconcolor= Color(0xff78ff9c);
const secondary = Color(0xffffa378);
const barGrey = Colors.grey;
const orderBar = Color(0xfffc773a);
const errorColor = const Color(0xffc5032b);
const splash = Colors.black12;
const textColor = Colors.black87; 
const begin = TextStyle(
  fontWeight: FontWeight.w400, 
  color: Colors.grey, 
  fontSize: 16,
  fontFamily: 'Montserrat'
);
const end = TextStyle(
  fontWeight: FontWeight.w600, 
  color: Colors.black87, 
  fontSize: 16,
  fontFamily: 'Montserrat'
);

class FTheme with ChangeNotifier {
  ThemeData esellDarkTheme = ThemeData.dark();

  ThemeData esellDefaultTheme = ThemeData(
    canvasColor: Colors.transparent,
    fontFamily: 'Montserrat',
    textSelectionColor: Colors.black38,
    textTheme: TextTheme( 
        headline: TextStyle(fontSize: 24.0, color: textColor),
        title: TextStyle(fontSize: 16.0, color: textColor),
        body1: TextStyle(fontSize: 12.0, color: textColor),
        body2: TextStyle(fontSize: 18.0, color: primaryDark),
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
