import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PDFooter extends StatelessWidget {
  final String id;
  PDFooter({this.id});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    final wishlist = Provider.of<WishlistModel>(context);
    final addToCart = () => cart.one(id);
    final addToWish = () => wishlist.one(id);
    return Container(
      width: MediaQuery.of(context).size.width - 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FRaisedButton(
            onPressed: addToWish,
            text: 'Wishlist',
            color: Colors.black,
          ),
          FRaisedButton(
            onPressed: addToCart,
            text: 'Add to cart',
          ),
        ],
      ),
    );
  }
}
