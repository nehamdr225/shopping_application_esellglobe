import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/CheckoutPage.dart';
import 'package:esell/pages/UserPromt.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/Snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:esell/state/src/theme.dart';

class PDFooter extends StatelessWidget {
  final String id, color, size, category;
  final int quantity;
  PDFooter({this.id, this.quantity, this.color, this.size, this.category});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final productModel = Provider.of<ProductModel>(context);

    addToCart() {
      if (category != null && category.contains('Sunglasses') ||
          category.contains('Watches') ||
          category.contains('Bags & Backpacks')) {
        if (color != null) {
          final status = user.addToCart(
              id,
              quantity,
              size,
              color,
              Provider.of<ProductModel>(context)
                  .one(id, category.split(';').first));
          print(status);
        } else
          buildAndShowSnackBar(context, 'Color not selected!');
      } else {
        if (size != null && color != null) {
          final status = user.addToCart(id, quantity, size, color,
              productModel.one(id, category.split(';').first));
          print(status);
        } else
          buildAndShowSnackBar(context, 'Size or color not selected!');
      }
    }

    //final addToWish = () => user.addToWishList(id);
    bool inCart = user.cart.any((cartItem) => cartItem['product'].id == id);

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
        children: user.token != null
            ? <Widget>[
                user.findCartItem(id) == true
                    ? FRaisedButton(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.40,
                        radius: 0.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        },
                        text: 'GOTO CART',
                        color: Colors.grey[600],
                        bg: Colors
                            .white, //Theme.of(context).colorScheme.secondaryVariant,
                        shape: true,
                      )
                    : FRaisedButton(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.40,
                        radius: 0.0,
                        onPressed: inCart ? () {} : addToCart,

                        ///###
                        text: inCart ? 'IN CART' : 'ADD TO CART',
                        color: Colors.grey[600],
                        shape: true,
                        bg: Colors
                            .white, //Theme.of(context).colorScheme.secondaryVariant,
                      ),
                user.findCartItem(id) == true
                    ? FRaisedButton(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.40,
                        radius: 0.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        },
                        text: 'GOTO CART',
                        color: Colors.white,
                        bg: Theme.of(context).colorScheme.secondaryVariant,
                        shape: true,
                      )
                    : FRaisedButton(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.40,
                        radius: 0.0,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CheckoutPage(items: [
                                        {
                                          'product': productModel.one(
                                              id, category.split(';').first),
                                          'quantity': quantity,
                                          'size': size,
                                          'color': color
                                        }
                                      ])));
                        },

                        ///###
                        text: 'BUY NOW',
                        color: Colors.white,
                        shape: true,
                        bg: Theme.of(context).colorScheme.secondaryVariant,
                      ),
              ]
            : <Widget>[
                FRaisedButton(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.90,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UserPromptApp()));
                  },

                  ///###
                  text: 'Login or Register',
                  color: Colors.white,
                  shape: true,
                  bg: Theme.of(context).colorScheme.secondaryVariant,
                ),
              ],
      ),
    );
  }
}
