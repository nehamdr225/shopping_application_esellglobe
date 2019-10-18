// import 'package:esell/pages/LoginPhone.dart';
// import 'package:esell/pages/Signin.dart';
//import 'package:esell/pages/Signup.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/widget/atoms/loginOptions.dart';

//import 'package:esell/widget/atoms/UP_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'package:esell/widget/atoms/BrandLogos.dart';
//import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/FancyText.dart';

class UserPromptApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: 130.0,
        //alignment: Alignment.center,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              //UPImage(),
              BrandLogos(height: 100.0, width: 100.0,),
              
              LoginOptions(),
              FancyText(
                  color: Colors.deepPurple[900],
                  text: "Continue without signin!",
                  size: 18.0,
                  fontfamily: 'Bree',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePageApp()));
                  }),
                
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              FancyText(
                  text: "Terms & Conditions",
                  decoration: TextDecoration.underline,
                  size: 17.0,
                  color: Colors.deepPurple[900],
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePageApp()));
                  })
            ]),
      ),
    );
  }
}
