import 'package:esell/pages/LoginPhone.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/pages/Signup.dart';
import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 260.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 270.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FRaisedButton(
                  height: 50.0,
                  width: 130.0,
                  needIcon: true,
                  shape: true,
                  image: 'images/icons/facebookicon.png',
                  text: "Facebook",
                  color: Colors.black87,
                  bg: Colors.white,
                  onPressed: () {},
                ),
                FRaisedButton(
                  height: 50.0,
                  width: 130.0,
                  shape: true,
                  image: 'images/icons/googleicon.png',
                  needIcon: true,
                  text: "Google",
                  color: Colors.black87,
                  bg: Colors.white,
                  onPressed: () {},
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          FRaisedButton(
            // email
            height: 50.0,
            width: 260.0,
            shape: true,
            needIcon: true,
            image: 'images/icons/email.png',
            text: "Login with Email Address",
            color: Colors.black87,
            bg: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage()));
            },
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          FRaisedButton(
            // phone no.
            height: 50.0,
            width: 260.0,
            shape: true,
            needIcon: true,
            image: 'images/icons/phone.png',
            text: "Login with Mobile Number",
            color: Colors.black87,
            bg: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPhone()));
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: FancyText(
                color: primaryDark,
                text: "New here? Register now!",
                size: 16.0,
                fontfamily: 'Helvetica',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                }),
          ),
        ],
      ),
    );
  }
}
