import 'package:esell/core/validators.dart';
import 'package:esell/entities/user.api.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignUpPage> {
  String name, email, password;
  String nameErr, emailErr, passwordErr, signupErr;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    final UserApi api = Provider.of<UserModel>(context).api;
    final Validator v = Provider.of<UserModel>(context).validator;

    var setName = (data) {
      if (v.nameValidator(data) && data != name)
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
      if (v.emailValidator(data) && data != email)
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
      setState(() {
        isActive = true;
      });
      var message = await api.signup(email, password, name);
      print(message);
      if (message['error'] != null)
        setState(() {
          signupErr = message['error'];
          isActive = false;
        });
      else {
        setState(() {
          isActive = false;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
      }
    };

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            title: "Register",
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: BrandLogos(),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
              child: FForms(
                type: TextInputType.text,
                text: "Name",
                onChanged: setName,
              ),
            ),
            nameErr != null
                ? Text(
                    nameErr,
                    textAlign: TextAlign.center,
                  )
                : Text(''),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
              child: FForms(
                  type: TextInputType.emailAddress,
                  text: "Email",
                  onChanged: setEmail),
            ),
            emailErr != null
                ? Text(
                    emailErr,
                    textAlign: TextAlign.center,
                  )
                : Text(''),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
              child: FForms(
                  type: TextInputType.text,
                  text: "Password",
                  obscure: true,
                  onChanged: setPassword),
            ),
            passwordErr != null
                ? Text(
                    passwordErr,
                    textAlign: TextAlign.center,
                  )
                : Text(''),
            signupErr != null ? Text(signupErr) : Text(''),
            // FForms(type: TextInputType.phone, text: "Mobile No."),
            Align(
              alignment: Alignment.center,
              child: isActive
                  ? CircularProgressIndicator()
                  : FRaisedButton(
                      text: "Register now",
                      width: 160.0,
                      height: 45.0,
                      shape: true,
                      color: Colors.white,
                      bg: primaryDark,
                      onPressed: signupUser,
                    ),
            ), //onPressed: () {}),
            SizedBox(height: 30.0),
            FancyText(
                text: "Already have an account?",
                color: primaryDark,
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
    );
  }
}
