import 'package:flutter/material.dart';
import '../widget/colors.dart';
import '../widget/atoms/Forms.dart';

class SignUpPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignUpPage> {
  String name, email, password, number;
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
                FForms(type: TextInputType.text, text: "Name"),
                SizedBox(height: 15.0),
                FForms(type: TextInputType.emailAddress, text: "Email"),
                SizedBox(height: 15.0),
                FForms(
                    type: TextInputType.text, text: "Password", obscure: true),
                SizedBox(height: 15.0),
                // FForms(type: TextInputType.phone, text: "Mobile No."),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
