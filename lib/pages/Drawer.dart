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
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: DrawerHeader(
                        decoration: BoxDecoration(
                          gradient: drawercolor,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 110.0,
                                width: 110.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "images/esell photo/3brown.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                userData.length > 0
                                    ? userData['name']
                                    : "Loading ...",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                  userData.length > 0
                                      ? userData['email']
                                      : "Loading ...",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Colors.white)),
                            ])),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: DrawerHeader(
                        decoration: BoxDecoration(
                          gradient: drawercolor,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 110.0,
                                width: 110.0,
                                child:
                                    Icon(Icons.person, color: Colors.black45),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
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
                                          .headline5),
                                  contentPadding: EdgeInsets.only(left: 5.0),
                                  trailing: Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserPromptApp()));
                                  },
                                ),
                              )
                            ])),
                  ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            DrawerEPanel(
              [
                ListItem(
                    title: Image.asset(
                      "images/icons/man.png",
                      height: 20.0,
                      width: 20.0,
                    ),
                    subtitle: "Men",
                    bodyBuilder: (context) => Column(
                          children: <Widget>[
                            DrawerElements(
                              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                              title: 'Top Wear',
                              icon: 'images/icons/tshirt.png',
                              iconSize: 0.0,
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
                              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                              title: 'Bottom Wear',
                              icon: 'images/icons/pant.png',
                              iconSize: 0.0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(text: 'Bottom Wear'),
                                ));
                              },
                            ),
                            DrawerElements(
                              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                              title: 'FootWear',
                              icon: 'images/icons/shoe.png',
                              iconSize: 0.0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(text: 'Foot Wear'),
                                ));
                              },
                            ),
                            DrawerElements(
                              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                              title: 'Watches & Glasses',
                              icon: 'images/icons/glassesandjunga.png',
                              iconSize: 0.0,
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
                    title: Image.asset("images/icons/woman.png",
                        height: 24.0, width: 24.0),
                    subtitle: "Women",
                    bodyBuilder: (context) => Column(
                          children: <Widget>[
                            DrawerElements(
                              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                              title: 'Top Wear',
                              icon: 'images/icons/tshirt.png',
                              iconSize: 0.0,
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
                              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                              title: 'Bottom Wear',
                              icon: 'images/icons/pant.png',
                              iconSize: 0.0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(text: 'Bottom Wear'),
                                ));
                              },
                            ),
                            DrawerElements(
                              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                              title: 'Foot Wear',
                              icon: 'images/icons/shoe.png',
                              iconSize: 0.0,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(text: 'Foot Wear'),
                                ));
                              },
                            ),
                            DrawerElements(
                              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                              title: 'Watches & Glasses',
                              icon: 'images/icons/glassesandjunga.png',
                              iconSize: 0.0,
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
            userData != null && token != null
                ? DrawerElements(
                    //Order
                    style: Theme.of(context).textTheme.headline3,
                    title: 'My Orders',
                    // icon: 'images/esellIcons/order.png',
                    iconWidget: Icon(
                      Icons.shopping_basket,
                      color: Colors.black
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnimatingLine()),
                      );
                    },
                  )
                : SizedBox.shrink(),
            DrawerElements(
              style: Theme.of(context).textTheme.headline3,
              //Coupons
              title: 'My Coupons',
              // icon: 'images/esellIcons/coupon.png',
              iconWidget: Icon(
                Icons.card_giftcard,
                color: Colors.black
              ),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomePageApp()));
              },
            ),
            DrawerElements(
              style: Theme.of(context).textTheme.headline3,
              //Wishlist
              title: 'My Wishlist',
              // icon: 'images/esellIcons/wishlist.png',
              iconWidget: Icon(
                Icons.favorite,
                color: Colors.black
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistPage()));
              },
            ),
            DrawerElements(
              style: Theme.of(context).textTheme.headline3,
              //Cart
              title: 'My Cart',
              // icon: 'images/esellIcons/cart.png',
              iconWidget: Icon(
                Icons.shopping_cart,
                color: Colors.black
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
            ),
            token != null
                ? Column(
                    children: <Widget>[
                      DrawerElements(
                        style: Theme.of(context).textTheme.headline3,
                        title: 'My Account',
                        // icon: 'images/esellIcons/account.png',
                        iconWidget: Icon(
                          Icons.account_circle,
                          color: Colors.black
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountPage()));
                        },
                      ),
                     
                    ],
                  )
                : Divider(
                    color: Colors.grey[500],
                    height: 5.0,
                  ),
            DrawerElements(
              style: Theme.of(context).textTheme.headline3,
              //Customer Service
              title: 'Help Center',
              // icon: 'images/esellIcons/helpcenter.png',
              iconWidget: Icon(
                Icons.headset_mic,
                color: Colors.black
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenter()),
                );
              },
            ),
            DrawerElements(
              style: Theme.of(context).textTheme.headline3,
              // About
              title: 'About',
              // icon: 'images/esellIcons/about.png',
              iconWidget: Icon(
                Icons.info_outline,
                color: Colors.black
              ),
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
