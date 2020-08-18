// import 'package:esell/models/user.model.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/src/user.dart';

class BlueAppBar extends StatelessWidget {
  final double elevation;
  final bool search;
  final bool cart;
  final String title;
  final Function onPressed;
  BlueAppBar(
      {this.elevation: 0.5,
      this.search: true,
      this.cart: true,
      this.title: '',
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5
      ),
      elevation: elevation,
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.back),
                Text(
                  "Back",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.white),
                ),
              ],
            ),
            onTap: onPressed
          ),
      actions: <Widget>[
        search == true
            ? FIcons(
                icon: Icon(Icons.search),
                alignment: Alignment.centerRight,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              )
            : Text(''),
        cart == true
            ? FIcons(
                icon: Image.asset(
                      "images/esellIcons/cart2.png",
                      height: 20.0,
                      width: 20.0,
                    ),
                alignment: Alignment.centerRight,
                onPressed: () {
                  user.token != null?
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage())):_showBottomSheet(context);
                })
            : Text('')
      ],
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


