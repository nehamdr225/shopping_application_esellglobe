import 'package:esell/pages/AccountPage.dart';
import 'package:esell/pages/HelpCenter.dart';
import 'package:esell/widget/AnimatingLine.dart';
import 'package:esell/widget/atoms/DrawerEPanel.dart';
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
                              'images/logo/logoonly.png',
                              height: 45.0,
                              width: 35.0,
                            ),
                          ),
                          Container(
                            //login/signup
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
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.0),
            ),
            DrawerEPanel(
              [
                ListItem(
                    title: Image.asset(
                      "images/esellIcons/man.png",
                      height: 25.0,
                      width: 25.0,
                    ),
                    subtitle: "Men",
                    bodyBuilder: (context) => Column(
                          children: <Widget>[
                            DrawerElements(
                              title: 'Top Wear',
                              icon: 'images/icons/tshirt.png',
                              iconSize: 23.0,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CategoryPage(text: 'Top Wear'),
                                  ),
                                );
                              },
                            ),
                            DrawerElements(
                              title: 'Bottom Wear',
                              icon: 'images/icons/pant.png',
                              iconSize: 23.0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(text: 'Bottom Wear'),
                                ));
                              },
                            ),
                            DrawerElements(
                              title: 'FootWear',
                              icon: 'images/icons/shoe.png',
                              iconSize: 23.0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(text: 'Foot Wear'),
                                ));
                              },
                            ),
                            DrawerElements(
                              title: 'Watches & Glasses',
                              icon: 'images/icons/glassesandjunga.png',
                              iconSize: 23.0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(text: 'Watches & Glasses'),
                                ));
                              },
                            ),
                          ],
                        )),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(3.0),
            ),
            DrawerEPanel(
              [
                ListItem(
                    title: Image.asset("images/esellIcons/woman.png",
                        height: 30.0, width: 30.0),
                    subtitle: "Women",
                    bodyBuilder: (context) => Column(
                          children: <Widget>[
                            DrawerElements(
                              title: 'Top Wear',
                              icon: 'images/icons/tshirt.png',
                              iconSize: 23.0,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CategoryPage(text: 'Top Wear'),
                                  ),
                                );
                              },
                            ),
                            DrawerElements(
                              title: 'Bottom Wear',
                              icon: 'images/icons/pant.png',
                              iconSize: 23.0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(text: 'Bottom Wear'),
                                ));
                              },
                            ),
                            DrawerElements(
                              title: 'FootWear',
                              icon: 'images/icons/shoe.png',
                              iconSize: 23.0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(text: 'Foot Wear'),
                                ));
                              },
                            ),
                            DrawerElements(
                              title: 'Watches & Glasses',
                              icon: 'images/icons/glassesandjunga.png',
                              iconSize: 23.0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(text: 'Watches & Glasses'),
                                ));
                              },
                            ),
                          ],
                        )),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(3.0),
            ),
            Divider(
              color: Colors.grey[500],
              height: 10.0,
            ),
            Padding(
              //text find your styke
              padding: const EdgeInsets.only(
                top: 18.0,
                left: 14.0,
                bottom: 5.0,
              ),
              child: Text(
                'Find your style',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 16.0),
              ),
            ),
            DrawerElements(
              //Order
              title: 'My Orders',
              icon: 'images/esellIcons/order.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatingLine()),
                );
              },
            ),
            DrawerElements(
              //Coupons
              title: 'My Coupons',
              icon: 'images/esellIcons/coupon.png',
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomePageApp()));
              },
            ),
            DrawerElements(
              //Wishlist
              title: 'My Wishlist',
              icon: 'images/esellIcons/wishlist.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistPage()));
              },
            ),
            DrawerElements(
              //Cart
              title: 'My Cart',
              icon: 'images/esellIcons/cart.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
            ),
            token != null
                ? Column(
                    children: <Widget>[
                      DrawerElements(
                        title: 'My Account',
                        icon: 'images/esellIcons/account.png',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountPage()));
                        },
                      ),
                      Divider(
                        color: Colors.grey[500],
                        height: 5.0,
                      ),
                    ],
                  )
                : Divider(
                    color: Colors.grey[500],
                    height: 5.0,
                  ),
            DrawerElements(
              //Customer Service
              title: 'Help Center',
              icon: 'images/esellIcons/helpcenter.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenter()),
                );
              },
            ),
            DrawerElements(
              // About
              title: 'About',
              icon: 'images/esellIcons/about.png',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            token != null
                ? FRaisedButton(
                    //Signout button
                    elevation: 0.0,
                    text: 'Sign Out',
                    bg: Colors.white,
                    shape: true,
                    color: Colors.red,
                    onPressed: () {
                      user.logout();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageApp()));
                    },
                  )
                : Text(''),
            SizedBox(
              height: 5.0,
            )
          ],
        ),
      ),
    );
  }
}
