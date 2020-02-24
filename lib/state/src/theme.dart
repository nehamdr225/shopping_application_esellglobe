import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const barGrey = Colors.grey;
const orderBar = Color(0xfffc773a);
const splash = Colors.black12;
const textColor = Colors.black87;
const primaryDark = Color(0xff3ea8cc);
const primary = Color(0xff78daff);
const shadowGrey = Color(0xffD8E1E8);

const begin = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.grey,
    fontSize: 16,
    fontFamily: 'Montserrat');
const end = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black87,
    fontSize: 16,
    fontFamily: 'Montserrat');

class FTheme with ChangeNotifier {
  ThemeData esellDarkTheme = ThemeData.dark();
  ThemeData esellDefaultTheme = ThemeData(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    colorScheme: ColorScheme(
      primary: Color(0xff3ea8cc),
      primaryVariant: Color(0xff3288a6),
      secondary: Color(0xffffa378),
      secondaryVariant: Color(0xfff06449),
      background: Color(0xfff2f3f5),
      onPrimary: Color(0xff78daff),
      onBackground: Colors.white, //Color(0xfff2f3f5),
      onError: Color(0xffc5032b),
      error: Color(0xffc5032b),
      onSecondary: Color(0xffffa378),
      onSurface: Color(0xffEEEEEE),
      brightness: Brightness.light,
      surface: Color(0xffEEEEEE),
      
    ),
    canvasColor: Colors.white,
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
