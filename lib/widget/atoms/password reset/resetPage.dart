import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/FancyText.dart';
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
    final width = MediaQuery.of(context).size.width;

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
          title: 'Change Password',
          onPressed: (){
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
            padding: EdgeInsets.all(15.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: primaryDark.withOpacity(0.5)
                ),
                borderRadius: BorderRadius.circular(5.0)
              ),
              alignment: Alignment.center,
                child: FancyText(
                  text: "$widget.email",
                  size: 18.0,
                  color: Colors.grey[700],
                ),),
          ),
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
              Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Enter OTP sent to your phone',
                style: Theme.of(context).textTheme.title.copyWith(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700)),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FForms(
                  underline: true,
                  text: 'OTP',
                  type: TextInputType.number,
                  height: 75.0,
                  width: width * 0.70,
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: width * 0.20,
                  child: Text('Resend',
                      style: Theme.of(context).textTheme.title.copyWith(
                          color: primaryDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                ),
                onTap: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: width * 0.40,
                  child: Text('Cancel',
                      style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
                onTap: () {},
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: width * 0.40,
                  child: Text('Save',
                      style: Theme.of(context).textTheme.title.copyWith(
                          color: primaryDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
                onTap: () {},
              ),
            ],
          ),
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
