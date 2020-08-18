import 'package:esell/core/validators.dart';
import 'package:esell/entities/user.api.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/pages/SendOTP.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SignUpPage> {
  String name, email, password, id;
  String phone;
  String phoneErr;
  String nameErr, emailErr, passwordErr, signupErr;
  bool isActive = false;
  var _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    final UserApi api = Provider.of<UserModel>(context).api;
    final Validator v = Provider.of<UserModel>(context).validator;

    var setName = (data) {
      setState(() {
        name = data;
      });
      print(v.nameValidator(data));
      if (v.nameValidator(data))
        setState(() {
          nameErr = null;
        });
      else if (nameErr == null)
        setState(() {
          nameErr = "Name is not valid! ( minimum 8 characters )";
        });
    };

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
      setState(() {
        password = data;
      });
      if (data.length >= 8)
        setState(() {
          passwordErr = null;
        });
      else if (passwordErr == null)
        setState(() {
          passwordErr =
              "Password not valid! ( must contain letters, numbers & symbols )";
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
          phoneErr = "Phone No. is not valid!";
        });
    };

    var signupUser = () async {
      setState(() {
        isActive = true;
      });
      final message = await api.signup(email, password, name, phone);
      //message & id
      print(message);
      if (message['error'] != null)
        setState(() {
          signupErr = message['error'];
          isActive = false;
        });
      else {
        setState(() {
          id = message['id'];
          isActive = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SendOTP(
                      id: message['id'],
                      phoneNo: '91$phone',
                    )));
      }
    };

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                      horizontal: 8.0, vertical: 28.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageApp()));
                        },
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
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
                          Text('Sign-up',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text("Name",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline4),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: FForms(
                type: TextInputType.text,
                text: "Enter your name",
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 15.0, color: Colors.black),
                labeltext: false,
                onChanged: setName,
              ),
            ),
            nameErr != null
                ? Padding(
                    padding: EdgeInsets.only(left: 40, bottom: 6),
                    child: Text(
                      nameErr,
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text("Email",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline4),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: FForms(
                type: TextInputType.emailAddress,
                text: "Enter your email",
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 15.0, color: Colors.black),
                labeltext: false,
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text('Password',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline4),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                    padding: EdgeInsets.only(left: 40, bottom: 6, right: 20),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text("Phone Number",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline4),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: FForms(
                  type: TextInputType.phone,
                  text: "Valid Mobile No",
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 15.0, color: Colors.black),
                  prefix: Text(
                    '+91   ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  labeltext: false,
                  onChanged: setPhoneNum),
            ),

            phoneErr != null
                ? Padding(
                    padding: EdgeInsets.only(left: 40, bottom: 6, top: 6),
                    child: Text(
                      phoneErr,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: orderBar,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  )
                : Text(''),
            signupErr != null
                ? Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      signupErr,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: orderBar,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  )
                : Text(''),
            // FForms(type: TextInputType.phone, text: "Mobile No."),
            Align(
              alignment: Alignment.center,
              child: isActive
                  ? CircularProgressIndicator()
                  : GradientButton(
                      text: "Sign in",
                      width: 160.0,
                      onPressed: signupUser,
                    ),
            ), //onPressed: () {}),
            SizedBox(height: 10.0),
            Center(
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  child: Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: 15.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  )),
            ),

            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
