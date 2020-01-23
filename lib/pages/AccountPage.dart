import 'package:esell/pages/AccountEdit.dart';
import 'package:esell/pages/AddressPage.dart';
import 'package:esell/pages/OrdertrackPage.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AccountCards.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final user = Provider.of<UserModel>(context);
    final userData = user.user;
    //final token = user.token;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: BlueAppBar(
            
          )),
      body: ListView(
        children: <Widget>[
          Stack(
            // Blue name card
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                color: primaryDark,
                height: height * 0.25,
                width: width,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Text(userData['name'],
                      style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: width * 0.55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(userData['email'],
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                            //SizedBox(width: width * 0.32,),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AccountEdit()));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          AccountCards(
            text: 'ESell Plus',
            buttonText: 'VIEW PLUS ZONE',
            onTap: () {},
          ),
          AccountCards(
            text: 'My Orders',
            buttonText: 'VIEW ALL ORDERS',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrdetrackPage()));
            },
          ),
          AccountCards(
            text: 'My Cards & Wallet',
            buttonText: 'VIEW DETAILS',
            onTap: () {},
          ),
          AccountCards(
            text: 'My Reviews',
            buttonText: 'VIEW YOUR REVIEWS',
            onTap: () {},
          ),
          AccountCards(
            text: 'My Questions & Answers',
            buttonText: 'VIEW YOUR Q&A',
            onTap: () {},
          ),
          AccountCards(
            text: 'My Addresses',
            capText: 'Save your delivery locations to place your orders faster',
            buttonText: 'ADD AN ADDRESS',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddressPage()));
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          FRaisedButton(
            text: 'Language Settings',
            color: textColor,
            bg: Colors.white,
            onPressed: () {},
            width: width * 0.90,
            height: 50.0,
          ),
          FRaisedButton(
            text: 'Notification Preferences',
            color: textColor,
            bg: Colors.white,
            onPressed: () {},
            width: width * 0.90,
            height: 50.0,
          ),
          FRaisedButton(
            text: 'Account Settings',
            color: textColor,
            bg: Colors.white,
            onPressed: () {},
            width: width * 0.90,
            height: 50.0,
          ),
          FRaisedButton(
            text: 'Logout of this app',
            color: textColor,
            bg: Colors.white,
            onPressed: () {},
            width: width * 0.90,
            height: 50.0,
          ),
          FRaisedButton(
            text: 'Logout of all devices',
            color: textColor,
            bg: Colors.white,
            onPressed: () {},
            width: width * 0.90,
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
