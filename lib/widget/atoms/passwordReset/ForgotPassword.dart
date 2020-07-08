import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/passwordReset/resetPage.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/core/validators.dart';
//import 'package:esell/entities/user.api.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email, password;
  String emailErr, passwordErr;
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    //final UserApi api = user.api;
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: BlueAppBar(
          elevation: 0.0,
          search: false,
          cart: false,
          title: 'Confirm Identity',
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
              icon: Icon(
                Icons.email,
                color: primaryDark,
              ),
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
          Align(
            alignment: Alignment.center,
            child: FRaisedButton(
              text: "Reset",
              fontWeight: FontWeight.w500,
              shape: true,
              width: 160.0,
              height: 45.0,
              bg: primaryDark,
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResetPage(
                              email: email,
                            )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
