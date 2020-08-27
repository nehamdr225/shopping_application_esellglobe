import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
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
                        Text('Password Recovery',
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
            child: GradientButton(
              text: "Reset Password",
              width: 160.0,
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
