import 'package:esell/pages/pages.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:flutter/material.dart';

class PDFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      FRaisedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WishlistPage()));
        },
        text: 'Wishlist',
        color: Colors.black,
      ),
      Padding(
        padding: EdgeInsets.all(5.0),
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
