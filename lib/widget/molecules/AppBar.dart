import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';
//import 'package:esell/widget/molecules/colors.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';

class FAppBar extends StatelessWidget {
  final wishlist;
  final cart;
  final search;
  final searchBar;
  final String title;
  final drawer;

  FAppBar({
    this.wishlist,
    this.drawer,
    this.cart,
    this.search,
    this.title,
    this.searchBar,
  });
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageApp()));
              },
            ),
          ),
          elevation: 0.0,
          iconTheme: IconThemeData(color: primaryDark),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(title,
                style: TextStyle(
                  color: primaryDark,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          actions: <Widget>[
            search != null
                ? FIcons(
                    icon: Icons.search,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                    },
                  )
                : Text(''),
            cart != null
                ? FIcons(
                    icon: Icons.shopping_cart,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      user.token != null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()))
                          : _showBottomSheet(context);
                    })
                : Text(''),
            wishlist != null
                ? FIcons(
                    icon: Icons.bookmark,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      user.token != null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WishlistPage()))
                          : _showBottomSheet(context);
                    })
                : Text('')
          ],
        ),
      ),
    );
  }

  _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.centerRight,
                    color: primary,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Center(
                        child: Image.asset(
                      'images/logo/logoonly1.png',
                      height: 60.0,
                      width: 60.0,
                    )),
                  ),
                  Container(
                    // buttons
                    child: LoginOptions(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
