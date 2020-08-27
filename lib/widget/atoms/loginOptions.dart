import 'package:esell/pages/Signin.dart';
import 'package:esell/pages/Signup.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:flutter/material.dart';
class LoginOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 260.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Align(
            alignment: Alignment.center,
            child: GradientButton(
              text: "Login with email/phone no.",
              width: 260.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18.0),
            alignment: Alignment.center,
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text(
                  "Register Now",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,//Theme.of(context).colorScheme.primary,
                      ),
                )),
          ),

          // FRaisedButton(
          //   height: 45.0,
          //   width: 260.0,
          //   shape: true,
          //   needIcon: false,
          //   //image: 'images/icons/email.png',
          //   text: "Register Now",
          //   color: Colors.black54,
          //   fontWeight: FontWeight.bold,
          //   bg: Colors.white,
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => SignUpPage()));
          //   },
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 15.0),
          //   child: FancyText(
          //       color: primaryDark,
          //       text: "New here? Register now!",
          //       size: 16.0,
          //       fontfamily: 'Helvetica',
          //       onTap: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => SignUpPage()));
          //       }),
          // ),
        ],
      ),
    );
  }
}
