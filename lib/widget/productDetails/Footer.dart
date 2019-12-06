import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/src/theme.dart';

class PDFooter extends StatelessWidget {
  final String id;
  PDFooter({this.id});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final addToCart = () => user.addToCart(id);
    final addToWish = () => user.addToWishList(id);
    return Container(
      height: 40.0,
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width - 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          user.findWishlistItem(id) == true
              ? FloatingActionButton(
                  backgroundColor: primary,
                  child: Icon(
                    Icons.bookmark,
                    color: iconthemedark,
                  ),
                  onPressed: () {},
                )
              : FloatingActionButton(
                  backgroundColor: iconthemelight,
                  child: Icon(
                    Icons.bookmark_border,
                    color: iconthemedark,
                  ),
                  onPressed: addToWish,
                ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          user.findCartItem(id) == true
              ? FRaisedButton(
                  height: 50.0,
                  width: 200.0,
                  onPressed: () {},
                  text: 'Added to cart',
                  color: textColor,
                  bg: primary,
                  shape: true,
                )
              : FRaisedButton(
                  height: 50.0,
                  width: 200.0,
                  onPressed: addToCart,
                  text: 'Add to cart',
                  color: textColor,
                  shape: true,
                  bg: primary,
                ),
        ],
      ),
    );
  }
}
