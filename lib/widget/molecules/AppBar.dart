import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/cupertino.dart';
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
    final theme = Theme.of(context);
    var user = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.back),
                Text(
                  "Back",
                  style: theme.textTheme.subtitle1,
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // leading:
          elevation: 0.0,
          iconTheme: theme.iconTheme,
          backgroundColor: theme.colorScheme.background,
          // centerTitle: true,
          // title: Padding(
          //   padding: const EdgeInsets.only(top: 8.0),
          //   child: Text(title,
          //       style: TextStyle(
          //         color: primaryDark,
          //         fontSize: 18.0,
          //         fontWeight: FontWeight.bold,
          //       )),
          // ),
          actions: <Widget>[
            search != null
                ? FIcons(
                    icon: Icon(Icons.search),
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
                ? InkWell(
                    child: Image.asset(
                      "images/esellIcons/cart2.png",
                      height: 20.0,
                      width: 20.0,
                    ),
                    onTap: () {
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
                    icon: Icon(Icons.bookmark_border),
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      user.token != null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WishlistPage()))
                          : _showBottomSheet(context);
                    })
                : Text(''),
                SizedBox(width:10.0)
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
              height: 300.0,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.centerRight,
                    color: Theme.of(context).colorScheme.primary,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  LoginOptions(),
                ],
              ),
            ),
          );
        });
  }
}
