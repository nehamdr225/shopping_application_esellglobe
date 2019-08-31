import 'package:esell/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/FancyText.dart';

class UserPromptApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: 130.0,
        //alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BrandLogos(),
            Padding(padding: EdgeInsets.all(12.0)),
            FRaisedButton(
              text: "Signin",
              color: Colors.white,
              bg:  Colors.purple[900],
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
            Padding(padding: EdgeInsets.all(12.0)),
            FRaisedButton(
              text: "Signup",
              color: Colors.white,
              bg:  Colors.purple[900],
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
            ),
            Padding(padding: EdgeInsets.all(12.0)),
            FancyText(
                text: "Continue without signin!",
                size: 20.0,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePageApp()));
                })
          ]),
    ));
  }
}
