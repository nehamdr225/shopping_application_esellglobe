import 'package:esell/core/validators.dart';
import 'package:esell/entities/user.api.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/pages/SendOTP.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
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
  String name, email, password, contact, id;
  String phone;
  String phoneErr;
  String nameErr, emailErr, passwordErr, signupErr, contactErr;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    final UserApi api = Provider.of<UserModel>(context).api;
    final Validator v = Provider.of<UserModel>(context).validator;

    var setName = (data) {
      setState(() {
        name = data;
      });
      if (v.nameValidator(data))
        setState(() {
          nameErr = null;
        });
      else if (nameErr != null)
        setState(() {
          nameErr = "Name is not valid!";
        });
    };

    var setEmail = (data) {
      setState(() {
        email = data;
      });
      if (v.emailValidator(data) && data != email)
        setState(() {
          emailErr = null;
        });
      else if (emailErr != null)
        setState(() {
          emailErr = "Email is not valid!";
        });
    };

    var setPassword = (data) {
      // pwdValidator(data) &&
      setState(() {
        password = data;
      });
      if (data.length >= 8)
        setState(() {
          passwordErr = null;
        });
      else if (passwordErr != null)
        setState(() {
          passwordErr = "Password not valid!";
        });
    };

    var setPhoneNum = (data) {
      setState(() {
        phone = data;
      });
      if (v.phoneValidator(data))
        setState(() {
          phoneErr = null;
        });
      else if (phoneErr == null)
        setState(() {
          phoneErr = "email is not valid!";
        });
    };

    var signupUser = () async {
      setState(() {
        isActive = true;
      });
      final message = await api.signup(email, password, name, contact);
      //message & id
      print(message);
      if (message['error'] != null)
        setState(() {
          signupErr = message['error'];
          isActive = false;
        });
      else {
        setState(() {
          id = message.id;
          isActive = false;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SendOTP()));
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
            title: 'Register',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageApp()));
            },
          ),
        ),
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
              padding: EdgeInsets.only(top: 0.0, bottom: 4.0),
              child: BrandLogos(),
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
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0, left: 25, right: 25),
              child: FForms(
                  type: TextInputType.phone,
                  text: "Phone Number",
                  prefix: Text(
                    '+91   ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  onChanged: setPhoneNum),
            ),
            contactErr != null
                ? Text(
                    contactErr,
                    textAlign: TextAlign.center,
                  )
                : Text(''),
            signupErr != null
                ? Text(
                    signupErr,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  )
                : Text(''),
            // FForms(type: TextInputType.phone, text: "Mobile No."),
            Align(
              alignment: Alignment.center,
              child: isActive
                  ? CircularProgressIndicator()
                  : FRaisedButton(
                      text: "Complete",
                      width: 160.0,
                      height: 45.0,
                      shape: true,
                      color: Colors.white,
                      bg: primaryDark,
                      onPressed: signupUser,
                    ),
            ), //onPressed: () {}),
            SizedBox(height: 10.0),
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
                }),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
