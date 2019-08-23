import 'package:EsellGlobe/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:EsellGlobe/widget/atoms/Forms.dart';
import 'package:EsellGlobe/widget/atoms/RaisedButton.dart';
import 'package:EsellGlobe/helpers/Validators.dart';
import 'package:EsellGlobe/helpers/Api.dart';
import 'package:EsellGlobe/widget/atoms/FancyText.dart';
import 'package:EsellGlobe/pages/Signup.dart';
import 'package:EsellGlobe/store/UserModel.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignInPage> {
  String email, password;
  String emailErr, passwordErr;
  String loginErr;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var user = Provider.of<UserModel>(context);

    var setEmail = (data) {
      if (emailValidator(data) && data != email)
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
      if (pwdValidator(data) && data != password && data.length >= 8)
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
        String token = await login(email, password);
        user.token = token;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePageApp()));
      } catch (err) {
        setState(() {
          loginErr = "Login failed!";
        });
      }
    };

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            height: 500.0,
            width: screenWidth * 0.95,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 10.0),
                ],
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: Column(
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
                      FRaisedButton(
                        text: "Login",
                        onPressed: loginUser,
                      ),
                      SizedBox(height: 30.0),
                      FancyText(
                          text: "Don't have an account? Register Here !",
                          size: 15.0,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          }),
                      loginErr ?? Text(loginErr)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
