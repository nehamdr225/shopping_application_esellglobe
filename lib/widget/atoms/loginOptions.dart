import 'package:esell/pages/LoginPhone.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/pages/Signup.dart';
import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/FancyText.dart';

class LoginOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 260.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          
          FRaisedButton(
            // phone no.
            height: 50.0,
            width: 260.0,
            shape: true,
            color: Colors.white,
            bg: Theme.of(context).colorScheme.secondary,
            text: "Login with Mobile Number",
            fontWeight: FontWeight.w600,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPhone()));
            },
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
