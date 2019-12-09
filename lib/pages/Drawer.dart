import 'package:esell/helpers/Api.dart';
import 'package:esell/widget/atoms/DrawerElements.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:esell/pages/UserPromt.dart';
import 'package:esell/pages/AboutPage.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/CategoryPage.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:esell/pages/Signin.dart';

import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final userData = user.user;
    final token = user.token;
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            userData != null && token != null
                //token != null
                ? UserAccountsDrawerHeader(
                    accountName: Text(
                        userData.length > 0 ? userData['name'] : "Loading ..."),
                    accountEmail: Text(userData.length > 0
                        ? userData['email']
                        : "Loading ..."),
                    currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, color: Colors.black45),
                      ),
                    ),
                    decoration: BoxDecoration(
                      gradient: drawercolor,
                    ),
                  )
                : DrawerHeader(
                    decoration: BoxDecoration(
                      //color: primary,
                      gradient: drawercolor,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40.0,
                            child: Image.asset(
                              'images/logo/logoonly1.png',
                              height: 45.0,
                              width: 45.0,
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            alignment: Alignment.bottomLeft,
                            child: ListTile(
                              title: Text('Log in   .   Sign up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500)),
                              contentPadding: EdgeInsets.only(left: 5.0),
                              trailing: Icon(
                                Icons.arrow_right,
                                color: textColor,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserPromptApp()));
                              },
                            ),
                          )
                        ])),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 14.0,
                bottom: 5.0,
              ),
              child: Text(
                'Search for Fashion',
                style:
                    Theme.of(context).textTheme.body2.copyWith(fontSize: 16.0),
              ),
            ),
            DrawerElements(
              title: 'Top Wear',
              icon: 'images/icons/tshirt.png',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(text: 'Top Wear'),
                  ),
                );
              },
            ),
            DrawerElements(
              title: 'Bottom Wear',
              icon: 'images/icons/pant.png',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryPage(text: 'Bottom Wear'),
                ));
              },
            ),
            DrawerElements(
              title: 'FootWear',
              icon: 'images/icons/shoe.png',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryPage(text: 'Foot Wear'),
                ));
              },
            ),
            DrawerElements(
              title: 'Watches & Glasses',
              icon: 'images/icons/glassesandjunga.png',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryPage(text: 'Watches & Glasses'),
                ));
              },
            ),
            Divider(
              color: Colors.grey[500],
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 14.0,
                bottom: 5.0,
              ),
              child: Text(
                'Find your style',
                style:
                    Theme.of(context).textTheme.body2.copyWith(fontSize: 16.0),
              ),
            ),
            DrawerElements(
              title: 'Home',
              icon: 'images/icons/homepage.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageApp()));
              },
            ),
            DrawerElements(
              title: 'Cart',
              icon: 'images/icons/cart.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
            ),
            DrawerElements(
              title: 'Wishlist',
              icon: 'images/icons/wishlist.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistPage()));
              },
            ),
            token != null
                ? Column(
                    children: <Widget>[
                      DrawerElements(
                        title: 'Account',
                        icon: 'images/icons/account.png',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                        },
                      ),
                      Divider(
                        color: Colors.grey[500],
                        height: 10.0,
                      ),
                    ],
                  )
                : Divider(
                    color: Colors.grey[500],
                    height: 5.0,
                  ),
            DrawerElements(
              title: 'About',
              icon: 'images/icons/about.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            token != null
                ? FRaisedButton(
                    text: 'Sign Out',
                    width: 100.0,
                    bg: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      logout();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageApp()));
                      user.token = null;
                      user.user = {};
                    },
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
