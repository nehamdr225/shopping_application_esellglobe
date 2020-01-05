import 'package:esell/pages/AccountEdit.dart';
import 'package:esell/pages/AddressPage.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/pages/OrdertrackPage.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AccountCards.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            elevation: 0.5,
            backgroundColor: primaryDark,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageApp()));
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
          Stack(// Blue name card
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
                    child: Image.asset(
                      'images/logo/logoonly1.png',
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0),),
                  Text('Name',
                      style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: width * 0.55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Email',
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                            //SizedBox(width: width * 0.32,),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AccountEdit()));
                              },
                            )
                          ],
                        ),
                      ),
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
          SizedBox(height: 10.0,),
          FRaisedButton(
            text: 'Language Settings',
            color: textColor,
            bg:  Colors.white,
            onPressed: (){},
            width: width * 0.90,
            height: 50.0,
          ),
          FRaisedButton(
            text: 'Notification Preferences',
            color: textColor,
            bg:  Colors.white,
            onPressed: (){},
            width: width * 0.90,
            height: 50.0,
          ),
          FRaisedButton(
            text: 'Account Settings',
            color: textColor,
            bg:  Colors.white,
            onPressed: (){},
            width: width * 0.90,
            height: 50.0,
          ),
          FRaisedButton(
            text: 'Logout of this app',
            color: textColor,
            bg:  Colors.white,
            onPressed: (){},
            width: width * 0.90,
            height: 50.0,
          ),
          FRaisedButton(
            text: 'Logout of all devices',
            color: textColor,
            bg:  Colors.white,
            onPressed: (){},
            width: width * 0.90,
            height: 50.0,
          ),

        ],
      ),
    );
  }
}
