import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';

class BlueAppBar extends StatelessWidget {
  final double elevation;
  final bool search;
  final bool cart;
   BlueAppBar({this.elevation:0.5, this.search:true, this.cart:true});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: primaryDark,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          //Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePageApp()));
        },
      ),
      actions: <Widget>[
        search == true ?
        FIcons(
          icon: Icons.search,
          alignment: Alignment.centerRight,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchPage()));
          },
        ):
        Text(''),
        cart == true? 
        FIcons(
            icon: Icons.shopping_cart,
            alignment: Alignment.centerRight,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            }):
            Text('')
      ],
    );
  }
}
