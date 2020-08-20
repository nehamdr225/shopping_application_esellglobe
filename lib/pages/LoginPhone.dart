import 'package:esell/pages/Home.dart';
import 'package:esell/pages/SendOTP.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
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
                color: primaryDark,
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
                    FancyText(
                        // continue w/o signin
                        color: textColor,
                        text: "Enter Verified Mobile Number",
                        size: 18.0,
                        fontfamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => HomePageApp()));
                        }),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    FForms(
                        type: TextInputType.phone,
                        text: "Phone Number",
                        prefix: Text('+91   ',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: textColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600)),
                        onChanged: setPhoneNum),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FancyText(
                          color: Theme.of(context).colorScheme.primary,
                          text: "Use Email-ID",
                          size: 16.0,
                          fontfamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    FRaisedButton(
                        text: "Send OTP",
                        width: 160.0,
                        height: 45.0,
                        shape: true,
                        color: Colors.white,
                        bg: primaryDark,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SendOTP(
                                      //phoneNo: phone
                                      )));
                        } //signupUser,
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
