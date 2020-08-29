import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const barGrey = Colors.grey;
const orderBar = Color(0xfffFFA8AC); //c773a);
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
      color: Colors.black,
    ),
    buttonColor: Color(0xffC4C4C4),
    colorScheme: ColorScheme(
      primary: Color(0xff3E91CC), //3E91CC
      primaryVariant: Color(0xff86C3EE), //55A6E0
      onPrimary: Color(0xff78daff),
      secondary: Color(0xffFFA8AC),
      secondaryVariant: Color(0xffFDFAFA),
      onSecondary: Color(0xffFDFAFA),
      background: Color(0xffFBFBFB), // 000000
      onBackground: Color(0xffEEEEEF), //Color(0xfff2f3f5),
      onError: Color(0xffc5032b),
      error: Color(0xffc5032b),
      onSurface: Color(0xffEEEEEF),
      brightness: Brightness.light,
      surface: Color(0xffFBFBFB),
    ),
    canvasColor: Colors.white,
    textSelectionColor: Colors.black38,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 16.0,
          color: Color(0xff000000),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 16.0,
          color: Color(0xff000000),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.normal),
      headline3: TextStyle(
          fontSize: 13.0,
          color: Color(0xff000000),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600),
      headline4: TextStyle(
          fontSize: 14.0,
          color: Color(0xff000000),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold),
      headline5: TextStyle(
          fontSize: 14.0,
          color: Color(0xffffffff),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold),
      headline6: TextStyle(
          fontSize: 12.0,
          color: Color(0xff000000),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700),
      bodyText1: TextStyle(
          fontSize: 12.0,
          color: Color(0xff757575),
          fontFamily: 'Nunito',
          fontWeight: FontWeight.normal),
      subtitle1: TextStyle(
          fontSize: 12.0,
          color: Color(0xff000000),
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w700),
      subtitle2: TextStyle(
          fontSize: 12.0,
          color: Color(0xff000000),
          fontFamily: 'Nunito',
          fontWeight: FontWeight.normal),
      caption: TextStyle(
          color: Color(0xffA1A1A1),
          fontSize: 13.0,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold),
      bodyText2: TextStyle(
          fontSize: 13.0,
          color: Color(0xff676767),
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold),
      overline: TextStyle(
          fontSize: 12.0,
          color: Color(0xff3E91CC),
          fontFamily: 'Nunito',
          letterSpacing: 1.0,
          fontWeight: FontWeight.normal),
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
