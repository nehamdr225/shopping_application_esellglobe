import 'package:esell/pages/Cart.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/Snackbar.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:esell/state/src/theme.dart';

class PDFooter extends StatelessWidget {
  final String id, color, size;
  final int quantity;
  PDFooter({this.id, this.quantity, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    addToCart() {
      if (size != null && color != null)
        user.addToCart(id, quantity, size, color,
            Provider.of<ProductModel>(context).one(id));
      else
        buildAndShowSnackBar(context, 'Size or color not selected!');
    }

    final addToWish = () => user.addToWishList(id);
    bool inCart = user.cart.any((cartItem) => cartItem['product']['_id'] == id);

    // final snackBar = (text, label, onPressed) => SnackBar(
    //       backgroundColor: primary,
    //       duration: Duration(seconds: 2),
    //       content: Text(text, style: Theme.of(context).textTheme.caption),
    //       action: SnackBarAction(
    //           label: label, textColor: Colors.white, onPressed: onPressed),
    //     );

    // void addToCartSnackBar(){
    //   if (user.findCartItem(id) == true)
    //   {
    //     Scaffold.of(context).showSnackBar(snackBar(
    //     "You item has been added to cart", "undo", ()=> Navigator.pop(context)));
    //   }

    // }

    return Container(
      height: 40.0,
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width - 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          user.findWishlistItem(id) == true
              ? FloatingActionButton(
                  backgroundColor: Colors.white,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                  text: 'Goto cart',
                  color: Colors.white,
                  bg: Theme.of(context).colorScheme.secondaryVariant,
                  shape: true,
                )
              : FRaisedButton(
                  height: 50.0,
                  width: 200.0,
                  onPressed: inCart ? () {} : addToCart,

                  ///###
                  text: inCart ? 'In Cart' : 'Add to cart',
                  color: Colors.white,
                  shape: true,
                  bg: Theme.of(context).colorScheme.secondaryVariant,
                ),
        ],
      ),
    );
  }
}
