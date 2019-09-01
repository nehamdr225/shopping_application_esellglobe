import 'package:esell/pages/pages.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/colors.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class FAppBar extends StatelessWidget {
  final wishlist;
  final cart;
  final search;
  FAppBar({this.wishlist, this.cart, this.search});
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black87);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: icontheme2),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            search != null? FIcons(
              icon: Icons.search,
              alignment: Alignment.centerRight,
              color: Colors.deepPurple[900],
              onPressed: () {},
            ):Text(''),
            cart != null? FIcons(
                icon: Icons.shopping_cart,
                alignment: Alignment.centerRight,
                color: Colors.deepPurple[900],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                }): Text(''),
            wishlist != null
                ? FIcons(
                    icon: Icons.bookmark,
                    alignment: Alignment.centerRight,
                    color: Colors.deepPurple[900],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WishlistPage()));
                    })
                : Text('')
          ],
        ),
      ),
    );
  }
}
