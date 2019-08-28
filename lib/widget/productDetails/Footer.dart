import 'package:EsellGlobe/pages/pages.dart';
import 'package:EsellGlobe/widget/atoms/RaisedButton.dart';
import 'package:flutter/material.dart';

class PDFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
      FRaisedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WishlistPage()));
        },
        text: 'Wish List',
        color: Colors.black,
      ),
      FRaisedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartPage()));
        },
        text: 'Add to cart',
      ),
    ]);
  }
}
