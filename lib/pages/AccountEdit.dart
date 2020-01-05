import 'package:esell/pages/AccountPage.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/ChangePassword.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';

class AccountEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            elevation: 0.5,
            backgroundColor: primaryDark,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountPage()));
              },
            ),
            actions: <Widget>[
              FIcons(
                icon: Icons.search,
                alignment: Alignment.centerRight,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              ),
              FIcons(
                  icon: Icons.shopping_cart,
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  })
            ],
          )),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                color: primaryDark,
                height: height * 0.20,
                width: width,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45.0,
                child: Image.asset(
                  'images/logo/logoonly1.png',
                  height: 45.0,
                  width: 45.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FForms(
              underline: true,
              text: 'First Name',
              height: 75.0,
              width: width * 0.90,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FForms(
              underline: true,
              text: 'Last Name',
              height: 75.0,
              width: width * 0.90,
            ),
          ),
          FRaisedButton(
            text: 'SUBMIT',
            color: primaryDark,
            bg:  Colors.white,
            onPressed: (){
              // Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => ChangePassword()));
            },
            width: width * 0.60,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            height: 50.0,
            elevation: 0.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FForms(
              underline: true,
              text: 'Email ID',
              height: 75.0,
              width: width * 0.90,
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FForms(
                  underline: true,
                  text: 'Mobile Number',
                  type: TextInputType.number,
                  height: 75.0,
                  width: width * 0.70,
                ),
              ),
              FRaisedButton(
                text: 'Update',
                color: primaryDark,
                bg: Colors.white,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ChangePassword()));
                },
                width: width * 0.22,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                height: 50.0,
                elevation: 0.0,
              ),
            ],
          ),
          FRaisedButton(
            text: 'Change Password',
            color: textColor,
            bg: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePassword()));
            },
            width: width * 0.25,
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
            height: 45.0,
            elevation: 0.0,
          ),
          FRaisedButton(
            text: 'Deactivate Account',
            color: textColor,
            bg: Colors.white,
            onPressed: () {
              // Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => ChangePassword()));
            },
            width: width * 0.25,
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
            height: 45.0,
            elevation: 0.0,
          ),
        ],
      ),
    );
  }
}
