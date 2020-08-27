import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:esell/widget/atoms/passwordReset/resetPage.dart';
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
                        Text('Confirm your identity!',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontSize: 16.0)),
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
          Align(
            alignment: Alignment.center,
            child: GradientButton(
              text: "Reset",
              width: 160.0,
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
