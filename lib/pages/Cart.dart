import 'package:esell/pages/CheckoutPage.dart';
import 'package:esell/pages/UserPromt.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/CartList.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List items = [];
  double price = 0.0;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
    final user = Provider.of<UserModel>(context);
    final width = MediaQuery.of(context).size.width;
    setState(() {
      items = user.cart;
      print(items);
    });

    if (items.length > 0) {
      double temp = 0;
      items.forEach((item) {
        temp += double.parse(product.one(item['product'])['price']) *
                item['quantity'] ??
            1;
      });
      if (temp > 0.0)
        setState(() {
          price = temp;
        });
    }

    updateCartItem(id, quan) {
      try {
        items.forEach((el) {
          if (el['product'] == id) {
            setState(() {
              el['quantity'] = quan;
            });
          }
        });
      } catch (err) {
        print(err);
      }
    }

    return SafeArea(
    child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: FAppBar(
          wishlist: true,
          title: 'Cart',
        )),
      backgroundColor: Colors.white,
      persistentFooterButtons: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(2.0),
            ),
            FRaisedButton(
              width: width * 0.45,
              text: "RS. ${price.toStringAsFixed(2)}",
              bg: iconthemelight,
              shape: true,
              color: textColor,
              onPressed: null,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            FRaisedButton(
              width: width * 0.45,
              color: Colors.white,
              shape: true,
              bg: Theme.of(context).colorScheme.primary,
              onPressed: () {
                user.token != null
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CheckoutPage(
                              items: items,
                              price: price,
                            )))
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => UserPromptApp()));
              },
              text: user.token != null ? 'Check Out' : 'Login to proceed',
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
            ),
          ],
        )
      ],
      body:  items != null && items.length > 0 
        ? ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var each = product.one(items[index]['product']);
            return each["error"] == null
              ? CartListView(
                  name: each['name'],
                  picture: each['media'][0]['src'].length > 0
                      ? each['media'][0]['src'][0]
                      : '',
                  price: each['price'],
                  id: each['_id'],
                  quantity: items[index]['quantity'] ?? 1,
                  setQuantity: updateCartItem,
                  token: user.token,
                  deleteFromCart: user.deleteFromCart,
                  size: items[index]['size'],
                  color: items[index]['color'],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200.0,
                  width: 300.0,
                  child: Image.asset('images/emptywishlist.png'),
                ),
                Text(
                  "Oops...Your cart is empty!",
                  style: TextStyle(fontSize: 24.0),
                ),
              ],
            ))
    ));
  }
}
