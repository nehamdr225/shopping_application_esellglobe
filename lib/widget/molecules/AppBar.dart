import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/colors.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class FAppBar extends StatelessWidget {
  final wishlist;
  final cart;
  final search;
  final searchBar;
  final String title;
  final drawer;
  
  FAppBar(
      {this.wishlist,
      this.drawer,
      this.cart,
      this.search,
      this.title,
      this.searchBar,
      });
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black87);
    var user = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: icontheme3),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(title, style: TextStyle(fontFamily: 'Bree', color: icontheme3)),
          actions: <Widget>[
            search != null
                ? FIcons(
                    icon: Icons.search,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SearchPage()));
                    },
                  )
                : Text(''),
            cart != null
                ? FIcons(
                    icon: Icons.shopping_cart,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
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
              height: 330.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      // close button
                      height: 30.0,
                      width: 30.0,
                      padding: EdgeInsets.only(top: 0.0),
                      child: IconButton(
                        color: icontheme3,
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Container(
                    // logo
                    height: 60.0,
                    padding: EdgeInsets.only(top: 0.0, bottom: 10.0),
                    child: ListTile(
                      title: Center(
                          child: Image.asset(
                        'images/logo/logoonly1.png',
                        height: 60.0,
                        width: 50.0,
                      )),
                    ),
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
