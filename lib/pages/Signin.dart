import 'package:esell/core/validators.dart';
import 'package:esell/entities/user.api.dart';
import 'package:esell/pages/SendOTP.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/pages/Signup.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/passwordReset/ForgotPassword.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

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
  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    final UserApi api = user.api;
    final Validator v = user.validator;

    var setEmail = (data) {
      setState(() {
        email = data;
      });
      if (v.emailValidator(data))
        setState(() {
          emailErr = null;
        });
      else if (emailErr == null)
        setState(() {
          emailErr = "Email is not valid!";
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
          passwordErr =
              "Password not valid! ( must contain letter, number & symbols )";
        });
    };

    var loginUser = () async {
      try {
        setState(() {
          isActive = true;
        });
        Map response = await api.login(email, password, remember);
        print(response);
        if (response['token'] != null) {
          user.token = response['token'];
          api.getUser(response['token']).then((result) {
            if (result['error'] == null) {
              if (result['message'] != null &&
                  result['message'] == "Auth failed") {
                delKeyVal("token").then((data) {
                  user.token = null;
                });
              } else if (result['result']['cart'] != null) {
                api.getCart(response['token']).then((data) {
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePageApp()),
            (Route<dynamic> route) => false,
          );
        } else if (response['error'] != null) {
          setState(() {
            loginErr = response['error'];
            isActive = false;
          });
        } else if (response['otp'] != null) {
          setState(() {
            isActive = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SendOTP(
                id: response['id'],
                loginInfo: {'email': email, 'password': password},
              ),
            ),
          );
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
          child: BlueAppBar(
            elevation: 0.0,
            search: false,
            cart: false,
            title: 'Login',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: <Widget>[
            Container(
              color: primaryDark,
              height: 10.0,
            ),
            Container(
                height: 20.0,
                color: primaryDark,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      color: Colors.white),
                )),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: BrandLogos(),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: FForms(
                type: TextInputType.emailAddress,
                text: "Email",
                onChanged: setEmail,
              ),
            ),
            emailErr != null
                ? Padding(
                    padding: EdgeInsets.only(left: 40, bottom: 6),
                    child: Text(
                      emailErr,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: orderBar,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  )
                : Text(''),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: FForms(
                  type: TextInputType.text,
                  text: "Password",
                  trailingIcon: IconButton(
                    color: primaryDark,
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      semanticLabel:
                          _passwordVisible ? 'hide password' : 'show password',
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible ^= true;
                      });
                    },
                  ),
                  obscure: _passwordVisible == false ? true : false,
                  onChanged: setPassword),
            ),
            passwordErr != null
                ? Padding(
                    padding: EdgeInsets.only(left: 40, bottom: 6, right: 10),
                    child: Text(
                      passwordErr,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: orderBar,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  )
                : Text(''),
                 FancyText(
                color: primaryDark,
                textAlign: TextAlign.end,
                text: "Forgot Password?",
                size: 15.0,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()));
                }),
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
                      bg: Colors.black38,
                      color: Colors.white,
                      onPressed: loginUser,
                    ),
            ),
            SizedBox(height: 30.0),
            FancyText(
                color: primaryDark,
                text: "Register",
                size: 15.0,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                })
          ],
        ),
      ),
    );
  }
}
