import 'package:flutter/material.dart';

class FTheme with ChangeNotifier {
  ThemeData esellDarkTheme = ThemeData.dark();

  ThemeData esellDefaultTheme = ThemeData(
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
