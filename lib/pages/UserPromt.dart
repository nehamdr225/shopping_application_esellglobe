import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/FancyText.dart';

class UserPromptApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppBar(
            title: "",
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BrandLogos(
                height: 100.0,
                width: 100.0,
              ),
              LoginOptions(),
              
              FancyText(
                  text: "Terms & Conditions",
                  decoration: TextDecoration.underline,
                  size: 15.0,
                  fontfamily: 'Montserrat',
                  color: primaryDark,
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomePageApp()));
                  }),
              // SizedBox(height: 50.0,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset("images/options.png")),
            ]),
      ),
    );
  }
}
