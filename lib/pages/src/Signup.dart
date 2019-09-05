import 'package:esell/helpers/Api.dart';
import 'package:esell/pages/pages.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

import 'package:esell/helpers/Validators.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/FancyText.dart';

class SignUpPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignUpPage> {
  String name, email, password;
  String nameErr, emailErr, passwordErr, signupErr;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

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
      // pwdValidator(data) &&
      if (data != password && data.length >= 8)
        setState(() {
          password = data;
          passwordErr = null;
        });
      else if (passwordErr != null)
        setState(() {
          passwordErr = "Password not valid!";
        });
    };

    var signupUser = () async {
      var message = await signup(email, password, name);
      if (message['error'] != null)
        setState(() {
          signupErr = message['error'];
        });
      else
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
    };

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            title: Text(
              "Sign-up",
              style: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomPadding: false,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            height: 600.0,
            width: screenWidth * 0.95,
            padding: EdgeInsets.only(
                      top: 5.0, left: 20.0, right: 20.0),
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
                signupErr != null ? Text(signupErr) : Text(''),
                SizedBox(height: 15.0),
                // FForms(type: TextInputType.phone, text: "Mobile No."),
                FRaisedButton(
                  text: "Sign-up",
                  color: Colors.white,
                  bg: Colors.deepPurple[900],
                  onPressed: signupUser,
                ), //onPressed: () {}),
                SizedBox(height: 30.0),
                FancyText(
                    text: "Already have an account?",
                    color: Colors.deepPurple[900],
                    decoration: TextDecoration.underline,
                    size: 15.0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
