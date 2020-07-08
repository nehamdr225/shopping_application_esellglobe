import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:esell/core/validators.dart';
//import 'package:esell/entities/user.api.dart';

class ResetPage extends StatefulWidget {
  final email;
  ResetPage({this.email});
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  String email, password;
  String emailErr, passwordErr;
  @override
  Widget build(BuildContext context) {
    //final UserModel user = Provider.of<UserModel>(context);
    //final UserApi api = user.api;
    //final Validator v = user.validator;
    //final width = MediaQuery.of(context).size.width;

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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: BlueAppBar(
          elevation: 0.0,
          search: false,
          cart: false,
          title: 'Password Recovery',
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
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: FForms(
              type: TextInputType.numberWithOptions(decimal: false),
              text: "OTP",
              //icon: Icon(Icons.confirmation_number, color: primaryDark,),
              onChanged: setPassword,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: FForms(
                type: TextInputType.text,
                text: "New Password",
                obscure: true,
                onChanged: setPassword),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: FForms(
                type: TextInputType.text,
                text: "Confirm Password",
                obscure: true,
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
          Align(
            alignment: Alignment.center,
            child: FRaisedButton(
              text: "Reset Password",
              fontWeight: FontWeight.w500,
              shape: true,
              width: 180.0,
              height: 45.0,
              bg: primaryDark,
              color: Colors.white,
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Reset()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
