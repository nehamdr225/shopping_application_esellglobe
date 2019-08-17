import 'package:flutter/material.dart';
import '../widget/colors.dart';
import '../widget/atoms/Buttons.dart';
import '../widget/atoms/Forms.dart';

class SignInPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignInPage> {
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 5.0, left: 20.0, right: 20.0, bottom: 20.0),
            child: Column(
              children: <Widget>[
                FForms(
                    type: TextInputType.emailAddress,
                    text: "Email",
                    onChanged: (event) {}),
                SizedBox(height: 15.0),
                FForms(
                    type: TextInputType.text,
                    text: "Password",
                    obscure: true,
                    onChanged: (event) {}),
                SizedBox(height: 15.0),
                FButton(text: "Login", onPressed: () {}),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
