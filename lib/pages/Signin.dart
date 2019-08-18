import 'package:flutter/material.dart';
// import '../widget/colors.dart';
// import '../widget/atoms/Buttons.dart';
import '../widget/atoms/Forms.dart';
import '../widget/atoms/RaisedButton.dart';

class SignInPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignInPage> {
  String email, password;

  @override
  Widget build(BuildContext context) {
    var setEmail = (data) => setState(() {
          data == email ? email = data : print('');
        });
    var setPassword = (data) => setState(() {
          data == password ? password = data: print('');
        });
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
                      type: TextInputType.emailAddress,
                      text: "Email",
                      onChanged: setEmail),
                  SizedBox(height: 15.0),
                  FForms(
                      type: TextInputType.text,
                      text: "Password",
                      obscure: true,
                      onChanged: setPassword),
                  SizedBox(height: 15.0),
                  FRaisedButton(
                    text: "Login",
                  ), //onPressed: () {}),
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
