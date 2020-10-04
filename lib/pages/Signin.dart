import 'package:esell/core/validators.dart';
import 'package:esell/pages/SendOTP.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/pages/Signup.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:esell/widget/atoms/passwordReset/ForgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class SignInPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignInPage> {
  final _formState = GlobalKey<FormState>();
  String email, password;
  String emailErr, passwordErr;
  String loginErr;
  bool remember = true;
  bool isActive = false;

  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
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
        Map response = await user.login(email, password, remember);
        setState(() {
          isActive = false;
        });
        if (response['token'] != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePageApp()),
            (Route<dynamic> route) => false,
          );
        } else if (response['error'] != null) {
          setState(() {
            loginErr = response['error'];
          });
        } else if (response['otp'] != null) {
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
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 110.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 45.0, vertical: 28.0),
                  child: Row(
                    children: [
                      BrandLogos(
                        height: 40.0,
                        width: 40.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      fontSize: 15.0,
                                      color: Colors.white.withOpacity(0.7),
                                      fontWeight: FontWeight.normal)),
                          Text('Sign-in',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontSize: 22.0)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Theme.of(context).colorScheme.primary,
              height: 10.0,
            ),
            Container(
                height: 40.0,
                color: Theme.of(context).colorScheme.primary,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0)),
                      color: Colors.white),
                )),
            Form(
              key: _formState,
              autovalidateMode: AutovalidateMode.always, //true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text('Email',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline4),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: FForms(
                      type: TextInputType.emailAddress,
                      text: "Enter your email",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 15.0, color: Colors.black),
                      labeltext: false,
                      onChanged: setEmail,
                      validator: (value) => v.emailValidator(value)
                          ? null
                          : "Email is not valid!",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text('Password',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline4),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    child: FForms(
                      type: TextInputType.text,
                      text: "Enter password",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 15.0, color: Colors.black),
                      labeltext: false,
                      trailingIcon: IconButton(
                        color: Theme.of(context).colorScheme.primary,
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          semanticLabel: _passwordVisible
                              ? 'hide password'
                              : 'show password',
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible ^= true;
                          });
                        },
                      ),
                      obscure: _passwordVisible == false ? true : false,
                      onChanged: setPassword,
                      validator: (value) => v.pwdValidator(value)
                          ? null
                          : "Password not valid! ( must contain letter, number & symbols )",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: remember,
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (bool newValue) {
                        setState(() {
                          remember = newValue;
                        });
                      }),
                  Text(
                    "Keep me Signed in",
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 14.0,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: 14.0,
                        ),
                  )),
            ),
            loginErr != null
                ? Text(loginErr, style: TextStyle(color: Colors.red))
                : Text(''),
            Align(
              alignment: Alignment.center,
              child: isActive
                  ? CircularProgressIndicator()
                  : GradientButton(
                      text: "Sign in",
                      width: 160.0,
                      onPressed: loginUser,
                    ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Text(
                    "Register",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: 15.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
