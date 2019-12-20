import 'package:esell/core/validators.dart';
import 'package:esell/entities/user.api.dart';
import 'package:esell/pages/Signup.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignInPage> {
  String email, password;
  String emailErr, passwordErr;
  String loginErr;
  bool remember = true;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    final UserApi api = user.api;
    final Validator v = user.validator;

    var setEmail = (data) {
      if (v.emailValidator(data) && data != email)
        setState(() {
          email = data;
          emailErr = null;
        });
      else if (emailErr == null)
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
      else if (passwordErr == null)
        setState(() {
          passwordErr = "Password not valid!";
        });
    };

    var loginUser = () async {
      try {
        setState(() {
          isActive = true;
        });
        Map token = await api.login(email, password, remember);
        if (token['error'] == null) {
          user.token = token['token'];
          api.getUser(token['token']).then((result) {
            if (result['error'] == null) {
              if (result['message'] != null &&
                  result['message'] == "Auth failed") {
                delKeyVal("token").then((data) {
                  user.token = null;
                });
              } else if (result['result']['cart'] != null) {
                api.getCart(token['token']).then((data) {
                  if (data['error'] == null)
                    user.cart = data['result']['products'];
                });
              }
              user.user = result['result'];
            }
          });
          setState(() {
            isActive = false;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePageApp()));
        } else {
          setState(() {
            loginErr = token['error'];
            isActive = false;
          });
        }
      } catch (err) {
        setState(() {
          isActive = false;
          loginErr = "Login failed!";
        });
      }
    };

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            title: "Sign In",
          ),
        ),
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: BrandLogos(),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
            loginErr != null
                ? Text(loginErr, style: TextStyle(color: Colors.red))
                : Text(''),
            Align(
              alignment: Alignment.center,
              child: isActive
                  ? CircularProgressIndicator()
                  : FRaisedButton(
                      text: "Sign in",
                      shape: true,
                      width: 160.0,
                      height: 45.0,
                      bg: primaryDark,
                      color: Colors.white,
                      onPressed: loginUser,
                    ),
            ),
            SizedBox(height: 30.0),
            FancyText(
                color: primaryDark,
                decoration: TextDecoration.underline,
                text: "Don't have an account? Register Here !",
                size: 15.0,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                })
          ],
        ),
      ),
    );
  }
}
