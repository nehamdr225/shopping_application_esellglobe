import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: BlueAppBar(
          elevation: 0.0,
          search: false,
          cart: false,
        ),
      ),
      body: Column(
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
          FancyText(
              color: textColor,
              text: "Email us your feed back",
              size: 18.0,
              fontfamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomePageApp()));
              }),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              child: FForms(
                width: size.width * 0.90,
                height: size.height * 0.10,
                type: TextInputType.emailAddress,
                text: 'Email Addess',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: size.height * 0.40,
              width: size.width * 0.90,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryDark),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Comment',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey[400]),
                    labelText: 'Comment',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 100.0,
            child: FRaisedButton(
              elevation: 0.0,
              bg: Theme.of(context).colorScheme.secondary,
              color: Colors.white,
              text: 'Send',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
