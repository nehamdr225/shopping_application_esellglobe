import 'package:esell/entities/cart.dart';
import 'package:esell/entities/product.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/CheckoutPage.dart';
import 'package:esell/pages/UserPromt.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/FOutlineButton.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/Snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:esell/state/src/theme.dart';

class PDFooter extends StatelessWidget {
  final String id, color, size, category;
  final Product product;
  final int quantity;
  PDFooter(
      {this.id,
      this.quantity,
      this.color,
      this.size,
      this.category,
      this.product});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    addToCart() {
      if (category != null && category.contains('Sunglasses') ||
          category.contains('Watches') ||
          category.contains('Bags & Backpacks')) {
        if (color != null) {
          final status = user.addToCart(id, quantity, size, color, product);
          print(status);
        } else
          buildAndShowSnackBar(context, 'Color not selected!');
      } else {
        if (size != null && color != null) {
          final status = user.addToCart(id, quantity, size, color, product);
          print(status);
        } else
          buildAndShowSnackBar(context, 'Size or color not selected!');
      }
    }

    //final addToWish = () => user.addToWishList(id);
    bool inCart = user.cart.any((cartItem) => cartItem.product.id == id);

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
                    ? FOutlineButton(
                        height: 45.0,
                        text: 'Goto Cart',
                        radius: 10.0,
                        color: Colors.black,
                        width: MediaQuery.of(context).size.width * 0.40,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        },
                      )
                    : FOutlineButton(
                        height: 45.0,
                        width: MediaQuery.of(context).size.width * 0.40,
                        text: inCart ? 'In Cart' : 'Add To Cart',
                        radius: 10.0,
                        color: Colors.black,
                        onPressed: inCart ? () {} : addToCart,
                      ),

                user.findCartItem(id) == true
                    ? FOutlineButton(
                        height: 45.0,
                        width: MediaQuery.of(context).size.width * 0.40,
                        text: 'Goto Cart',
                        radius: 10.0,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        },
                      )
                   
                    : GradientButton(
                        width: MediaQuery.of(context).size.width * 0.40,
                        text: 'Buy Now',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CheckoutPage(items: [
                                        CartItem.fromJson({
                                          'product': product.toJson(),
                                          'quantity': quantity,
                                          'size': size,
                                          'color': color
                                        })
                                      ])));
                        },
                      )

                // FRaisedButton(
                //     height: 50.0,
                //     width: MediaQuery.of(context).size.width * 0.40,
                //     radius: 0.0,

                //     ///###

                //     color: Colors.white,
                //     shape: true,
                //     bg: Theme.of(context).colorScheme.secondaryVariant,
                //   ),
              ]
            : <Widget>[
                GradientButton(
                  text: 'Login or Register',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UserPromptApp()));
                  },
                )
                // FRaisedButton(
                //   height: 50.0,
                //   width: MediaQuery.of(context).size.width * 0.90,
                //   onPressed: (){},

                //   ///###

                //   color: Colors.white,
                //   shape: true,
                //   bg: Theme.of(context).colorScheme.secondaryVariant,
                // ),
              ],
      ),
    );
  }
}
