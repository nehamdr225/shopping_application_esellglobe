import 'package:esell/pages/Home.dart';
import 'package:esell/pages/SendOTP.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';
import 'package:esell/core/validators.dart';
//import 'package:esell/entities/user.api.dart';

class LoginPhone extends StatefulWidget {
  @override
  _LoginPhoneState createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  String phone;
  String phoneErr;
  String loginErr;
  bool remember = true;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final UserModel user = Provider.of<UserModel>(context);
    //final UserApi api = user.api;
    final Validator v = user.validator;

    var setPhoneNum = (data) {
      if (v.emailValidator(data) && data != phone)
        setState(() {
          phone = data;
          phoneErr = null;
        });
      else if (phoneErr == null)
        setState(() {
          phoneErr = "email is not valid!";
        });
    };
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: BlueAppBar(
            elevation: 0.0,
            search: false,
            cart: false,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageApp()));
            },
          ),
        ),
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: <Widget>[
            Container(
              color: Theme.of(context).colorScheme.primary,
              height: 10.0,
            ),
            Container(
                height: 20.0,
                color: Theme.of(context).colorScheme.primary,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      color: Colors.white),
                )),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 600.0,
                width: screenWidth * 0.95,
                padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    BrandLogos(),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: FForms(
                            type: TextInputType.text,
                            text: "Enter Verified Mobile Number",
                            obscure: true,
                            onChanged: () {})),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: FForms(
                            type: TextInputType.text,
                            text: "Phone Number",
                            obscure: true,
                            prefix: Text('+91   ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600)),
                            onChanged: setPhoneNum)),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: FForms(
                            type: TextInputType.text,
                            text: "Use Email-ID",
                            obscure: true,
                            onChanged: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInPage()));
                            })),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GradientButton(
                        text: "Send OTP",
                        width: 160.0,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SendOTP(
                                      //phoneNo: phone
                                      )));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
