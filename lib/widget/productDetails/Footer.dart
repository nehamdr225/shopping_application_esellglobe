import 'package:EsellGlobe/pages/pages.dart';
import 'package:EsellGlobe/widget/productDetails/RaisedButton.dart';
import 'package:flutter/material.dart';

class PDFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      PDRbutton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WishlistPage()));
        },
        text: 'Wish List',
        color: Colors.black,
      ),
      PDRbutton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartPage()));
        },
        text: 'Add to cart',
        color: Colors.white,
      ),
    ]);
  }
}
