import 'package:flutter/material.dart';
import '../widget/atoms/Forms.dart';
import '../widget/atoms/RaisedButton.dart';
import '../helpers/Validators.dart';

class SignUpPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignUpPage> {
  String name, email, password;
  String nameErr, emailErr, passwordErr;
  @override
  Widget build(BuildContext context) {
    var setName = (data) {
      if (nameValidator(data) && data != name)
        setState(() {
          name = data;
          nameErr = null;
        });
      else if (emailErr != null)
        setState(() {
          nameErr = "name is not valid!";
        });
    };

    var setEmail = (data) {
      if (emailValidator(data) && data != email)
        setState(() {
          email = data;
          emailErr = null;
        });
      else if (emailErr != null)
        setState(() {
          emailErr = "email is not valid!";
        });
    };

    var setPassword = (data) {
      if (pwdValidator(data) && data != password && data.length >= 8)
        setState(() {
          password = data;
          passwordErr = null;
        });
      else if (passwordErr != null)
        setState(() {
          passwordErr = "Password not valid!";
        });
    };

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
                    onChanged: setName,
                  ),
                  nameErr != null
                      ? Text(
                          nameErr,
                          textAlign: TextAlign.center,
                        )
                      : Text(''),
                  SizedBox(height: 15.0),
                  FForms(
                      type: TextInputType.emailAddress,
                      text: "Email",
                      onChanged: setEmail),
                  emailErr != null
                      ? Text(
                          emailErr,
                          textAlign: TextAlign.center,
                        )
                      : Text(''),
                  SizedBox(height: 15.0),
                  FForms(
                      type: TextInputType.text,
                      text: "Password",
                      obscure: true,
                      onChanged: setPassword),
                  passwordErr != null
                      ? Text(
                          passwordErr,
                          textAlign: TextAlign.center,
                        )
                      : Text(''),
                  SizedBox(height: 15.0),
                  // FForms(type: TextInputType.phone, text: "Mobile No."),
                  FRaisedButton(
                    text: "Register",
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
