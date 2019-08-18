import 'package:flutter/material.dart';
import '../../pages/Signin.dart';
import '../../pages/Signup.dart';

class FRaisedButton extends StatelessWidget {
  final String text;
  FRaisedButton({this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 40.0,
      child: RaisedButton(
        color: Colors.deepPurple[900],
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Victorian',
            fontSize: 32.0,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        onPressed: () {
          switch (text) {
            case "Login":
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage()));
              break;
            case "Signup":
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
              break;
          }
        },
      ),
    );
  }
}
