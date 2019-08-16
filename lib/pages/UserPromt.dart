import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import '../widget/atoms/BrandLogos.dart';
import '../widget/atoms/RaisedButton.dart';
import '../widget/atoms/FancyText.dart';

class UserPromptApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return SafeArea(
        child: Container(
      color: Colors.white,
      width: 130.0,
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BrandLogos(),
            Padding(padding: EdgeInsets.all(12.0)),
            FRaisedButton(text: "Login"),
            Padding(padding: EdgeInsets.all(12.0)),
            FRaisedButton(text: "Signup"),
            Padding(padding: EdgeInsets.all(12.0)),
            FancyText(text: "Continue without signin!")
          ]),
    ));
  }
}
