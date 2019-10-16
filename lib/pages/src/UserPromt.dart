import 'package:esell/pages/pages.dart';
import 'package:esell/widget/atoms/UP_Image.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              UPImage(),
              BrandLogos(),
              Container(
                width: 260.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FRaisedButton(
                        height: 50.0,
                        width: 120.0,
                        shape: true,
                        text: "Facebook",
                        color: Colors.black87,
                        bg: Colors.white,
                        onPressed: () {},
                      ),
                      FRaisedButton(
                        height: 50.0,
                        width: 120.0,
                        shape: true,
                        text: "Google",
                        color: Colors.black87,
                        bg: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(8.0),),
                  FRaisedButton(
                    height: 50.0,
                    shape: true,
                    width: 260.0,
                    text: "Login with email",
                    color: Colors.black87,
                    bg: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0),),
                  FRaisedButton(
                    height: 50.0,
                    width: 260.0,
                    shape: true,
                    text: "Create a new account",
                    color: Colors.black87,
                    bg: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                  ),
                ],
              )),
              FancyText(
                  color: Colors.deepPurple[900],
                  text: "Continue without signin!",
                  size: 20.0,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePageApp()));
                  }),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              FancyText(
                  text: "Terms & Conditions",
                  decoration: TextDecoration.underline,
                  size: 17.0,
                  color: Colors.deepPurple[900],
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePageApp()));
                  })
            ]),
      ),
    );
  }
}
