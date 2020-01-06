import 'package:esell/pages/AccountPage.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/ChangePassword.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class AccountEdit extends StatefulWidget {
  @override
  _AccountEditState createState() => _AccountEditState();
}

class _AccountEditState extends State<AccountEdit> {
  List name = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final user = Provider.of<UserModel>(context);
    final userData = user.user;
    final token = user.token;

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
                child: userData['media'] != null
                    ? Image.network(userData['media'])
                    : Text(
                        userData['name'].split(' ').reduce((a, b) {
                          return '${a[0]} ${b[0]}';
                        }),
                        style: Theme.of(context).textTheme.body1.copyWith(
                            color: primaryDark,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700),
                      ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          token != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'First Name',
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(color: Colors.grey[500]),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        userData['name'].split(' ').reduce((a, b) {
                          return '$a';
                        }),
                        style: Theme.of(context).textTheme.body1.copyWith(
                            color: textColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FForms(
                    underline: true,
                    text: 'First Name',
                    height: 75.0,
                    width: width * 0.90,
                  ),
                ),
          token != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Last Name',
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(color: Colors.grey[500]),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          userData['name'].split(' ').reduce((a, b) {
                            return '$b';
                          }),
                          style: Theme.of(context).textTheme.body1.copyWith(
                              color: textColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                )
              : Padding(
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
            bg: Colors.white,
            onPressed: () {
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
