import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class LoginPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            title: Text(
              "Login with Phone",
              style: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
        ),
        resizeToAvoidBottomPadding: false,
        body: Align(
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
                  FancyText( // continue w/o signin
                  color:  Theme.of(context).colorScheme.primary,
                  text: "Enter Verified Mobile Number",
                  size: 18.0,
                  fontfamily: 'Bree',
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomePageApp()));
                  }),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  FForms(
                      type: TextInputType.phone,
                      text: "Phone Number",
                      //onChanged: setEmail
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}