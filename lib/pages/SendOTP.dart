import 'package:esell/entities/user.api.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:esell/widget/atoms/pinOTP.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class SendOTP extends StatefulWidget {
  final String phoneNo, id;
  final Function onChanged;
  final Map<String, String> loginInfo;
  SendOTP({this.phoneNo, this.onChanged, this.loginInfo, this.id});

  @override
  _SendOTPState createState() => _SendOTPState();
}

class _SendOTPState extends State<SendOTP> {
  String otpErr;
  String pin = '';
  bool isVerifying = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final UserModel user = Provider.of<UserModel>(context);
    final UserApi api = user.api;

    setPin(newPin) {
      setState(() {
        pin = newPin;
      });
    }

    void handleOtpVerification() async {
      setState(() {
        isVerifying = true;
      });
      final response = await api.verifyOtp(widget.id, pin);
      print(response);
      if (response['message'] != null) {
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
            setState(() {
              isVerifying = false;
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageApp()));
          } else {
            setState(() {
              isVerifying = false;
            });
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          }
        } else {
          setState(() {
            isVerifying = false;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInPage()));
        }
      } else {
        setState(() {
          otpErr = 'OTP verification failed!';
          isVerifying = false;
        });
      }
    }

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
                    FancyText(
                      // continue w/o signin
                      color: textColor,
                      text: widget.phoneNo != null
                          ? "Please enter OTP we have sent you on \n  \n +91 ${widget.phoneNo}"
                          : "Please enter OTP we have sent you on \n  \n Your mobile no",
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
                      onSubmit: setPin,
                    ),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                    ),
                    !isVerifying
                        ? Align(
                            alignment: Alignment.center,
                            child: GradientButton(
                              text: "Verify",
                              width: 160.0,
                              onPressed: pin?.length == 6
                                  ? () {
                                      handleOtpVerification();
                                    }
                                  : null,
                            ),
                          )
                        : Container(
                            child: CircularProgressIndicator(),
                            alignment: Alignment.center,
                          ),
                    otpErr != null
                        ? Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              otpErr,
                              style: TextStyle(
                                  color: orderBar,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Text(''),
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
