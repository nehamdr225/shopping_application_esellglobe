import 'package:esell/entities/user.api.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/pinOTP.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class SendOTP extends StatefulWidget {
  final String phoneNo;
  final Function onChanged;
  final Map<String, String> loginInfo;
  SendOTP({this.phoneNo: '9840056679', this.onChanged, this.loginInfo});

  @override
  _SendOTPState createState() => _SendOTPState();
}

class _SendOTPState extends State<SendOTP> {
  String otpErr, id;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final UserModel user = Provider.of<UserModel>(context);
    final UserApi api = user.api;

    final handleOtpVerification = (String otp) async {
      final response = await api.verifyOtp(id, otp);
      if (response['message']) {
        //otp success
        if (widget.loginInfo != null) {
          Map response = await api.login(
              widget.loginInfo['email'], widget.loginInfo['password'], true);
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageApp()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          }
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInPage()));
        }
      } else {
        setState(() {
          otpErr = 'Failed otp verification!';
        });
      }
    };

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
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
                      text:
                          "Please enter OTP we have sent you on \n  \n +91 ${widget.phoneNo}",
                      size: 16.0,
                      fontfamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    PinOTP(
                      fields: 6,
                      fieldWidth: 35.0,
                      fontSize: 20.0,
                      onSubmit: handleOtpVerification,
                    ),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                    ),
                    FRaisedButton(
                      text: "Verify",
                      width: 160.0,
                      height: 45.0,
                      shape: true,
                      color: Colors.white,
                      bg: primaryDark,
                      onPressed: handleOtpVerification,
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
