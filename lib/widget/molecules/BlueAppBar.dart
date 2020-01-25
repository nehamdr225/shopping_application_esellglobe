import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';

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
    return AppBar(
      title: Text(title,
          style: TextStyle(
              fontFamily: 'Montserrat', color: Colors.white, fontSize: 17.0)),
      elevation: elevation,
      backgroundColor: primaryDark,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onPressed,
      ),
      actions: <Widget>[
        search == true
            ? FIcons(
                icon: Icons.search,
                alignment: Alignment.centerRight,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              )
            : Text(''),
        cart == true
            ? FIcons(
                icon: Icons.shopping_cart,
                alignment: Alignment.centerRight,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                })
            : Text('')
      ],
    );
  }
}
