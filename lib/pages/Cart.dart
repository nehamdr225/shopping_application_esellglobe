import 'package:esell/entities/cart.dart';
import 'package:esell/pages/CheckoutPage.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/CartList.dart';
import 'package:esell/widget/molecules/CartPrice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> items = [];
  double price = 0.0;
  double total = 0.0;
  double deliveryPrice = 65.0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final width = MediaQuery.of(context).size.width;
    final userData = user.user;
    final token = user.token;
    // final height = MediaQuery.of(context).size.height;
    setState(() {
      items = user.cart;
    });

    if (items.length > 0) {
      double temp = 0;
      items.forEach((item) {
        temp += double.parse(item.product.price.replaceAll(',', '')) *
            item.quantity;
      });
      if (temp > 0.0)
        setState(() {
          price = temp;
          total = temp + deliveryPrice;
        });
    }

    updateCartItem(id, quan) {
      try {
        items.forEach((el) {
          if (el.product.id == id) {
            setState(() {
              el.quantity = quan;
            });
          }
        });
      } catch (err) {
        print(err);
      }
    }

    // print(user.cart[0]['color']);
    if (userData == null && token == null && items == null)
      return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: FAppBar(
                wishlist: true,
                title: 'Cart',
              )),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "You need to Login first",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: 16.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                GradientButton(
                  text: "Login",
                  width: 150.0,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignInPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      );
    if (items == null || items.isEmpty)
      return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: FAppBar(
                wishlist: true,
                title: 'Cart',
              )),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: ListView(
            children: [
              Center(
                heightFactor: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      width: 300.0,
                      child: Image.asset('images/emptywishlist.png'),
                    ),
                    Text(
                      "Oops...Your cart is empty!",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: FAppBar(
              wishlist: true,
              title: 'Cart',
            )),
        backgroundColor: Theme.of(context).colorScheme.background,
        persistentFooterButtons: <Widget>[
          Container(
            height: 160.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 110.0,
                    color: Theme.of(context).colorScheme.background,
                    child: CartPrice(
                      length: items.length,
                      price: price.toStringAsFixed(2),
                      total: total.toStringAsFixed(2),
                    )),
                FRaisedButton(
                  width: width * 0.95,
                  height: 40.0,
                  bg: Theme.of(context).colorScheme.primary,
                  text: 'Proceed to Checkout',
                  color: Colors.white,
                  shape: true,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CheckoutPage(
                                  items: items,
                                  total: total.toStringAsFixed(2),
                                )));
                  },
                )
              ],
            ),
          )
        ],
        body: ListView.builder(
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            return index != items.length
                ? CartListView(
                    color: items[index].color,
                    quantity: items[index].quantity,
                    setQuantity: updateCartItem,
                    token: user.token,
                    deleteFromCart: user.deleteFromCart,
                    size: items[index].size,
                    product: items[index].product)
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
