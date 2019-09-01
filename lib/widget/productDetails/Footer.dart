import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/colors.dart';
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
          wishlist.find(id) == true
              ? FRaisedButton(
                  onPressed: () {},
                  text: 'In Wishlist',
                  color: Colors.white,
                  bg: icontheme2,
                )
              : FRaisedButton(
                  onPressed: addToWish,
                  text: 'Wishlist',
                  color: Colors.white,
                  bg: icontheme2,
                ),
          cart.find(id) == true
              ? FRaisedButton(
                  onPressed: () {},
                  text: 'Added to cart',
                  color: Colors.white,
                  bg: icontheme2,
                )
              : FRaisedButton(
                  onPressed: addToCart,
                  text: 'Add to cart',
                  color: Colors.white,
                  bg: icontheme2,
                ),
        ],
      ),
    );
  }
}
