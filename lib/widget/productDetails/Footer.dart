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
      height: 40.0,
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width - 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          wishlist.find(id) == true
              ? FloatingActionButton(
                backgroundColor: icontheme,
                child: Icon(Icons.bookmark, color: icontheme2,),
                onPressed: (){},
              )
              :
              FloatingActionButton(
                backgroundColor: icontheme,
                child: Icon(Icons.bookmark_border, color: icontheme2,),
                onPressed: addToWish,
              ),
              Padding(padding: EdgeInsets.all(10.0),),
          cart.find(id) == true
              ? FRaisedButton(
                  height: 50.0,
                  width: 200.0,
                  onPressed: () {},
                  text: 'Added to cart',
                  color: Colors.white,
                  bg: icontheme2,
                )
              : FRaisedButton(
                  height: 50.0,
                  width: 200.0,
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
