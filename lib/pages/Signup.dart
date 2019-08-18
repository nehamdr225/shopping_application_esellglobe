import 'package:flutter/material.dart';
//import '../widget/colors.dart';
//import '../widget/atoms/Buttons.dart';
import '../widget/atoms/Forms.dart';
import '../widget/atoms/RaisedButton.dart';

class SignUpPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignUpPage> {
  String name, email, password, number;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 5.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: Column(
                children: <Widget>[
                  FForms(
                    type: TextInputType.text,
                    text: "Name",
                    onChanged: (event) {},
                  ),
                  SizedBox(height: 15.0),
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
                  // FForms(type: TextInputType.phone, text: "Mobile No."),
                  FRaisedButton(text: "Register", ),//onPressed: () {}),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
