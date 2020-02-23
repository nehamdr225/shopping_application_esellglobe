import 'package:esell/pages/CheckoutPage.dart';
import 'package:esell/pages/UserPromt.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/CartList.dart';
import 'package:esell/widget/molecules/CartPrice.dart';
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
      //print(items);
    });

    if (items.length > 0) {
      double temp = 0;
      items.forEach((item) {
        temp += double.parse(item['product']['price']) * item['quantity'] ?? 1;
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
        child: userData != null && token != null
            ? Scaffold(
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(40.0),
                    child: FAppBar(
                      wishlist: true,
                      title: 'Cart',
                    )),
                backgroundColor: Theme.of(context).colorScheme.background,
                persistentFooterButtons: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(2.0),
                      ),
                      FRaisedButton(
                        width: width * 0.45,
                        height: 40.0,
                        text: "RS. ${total.toStringAsFixed(2)}",
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
                        height: 40.0,
                        shape: true,
                        bg: Theme.of(context).colorScheme.secondaryVariant,
                        onPressed: () {
                          user.token != null
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CheckoutPage(
                                            items: items,
                                            price: total,
                                          )))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => UserPromptApp()));
                        },
                        text: user.token != null
                            ? 'Check Out'
                            : 'Login to proceed',
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                      ),
                    ],
                  )
                ],
                body: items != null && items.length > 0
                    ? ListView.builder(
                        itemCount: items.length + 1,
                        itemBuilder: (context, index) {
                          return index != items.length
                              ? CartListView(
                                  name: items[index]['product']['name'] ??
                                      'error product',
                                  picture: items[index]['product']['media'] !=
                                              null &&
                                          items[index]['product']['media']
                                                  .length >
                                              0 &&
                                          items[index]['product']['media'][0]
                                                  ['src'] !=
                                              null &&
                                          items[index]['product']['media'][0]
                                                      ['src']
                                                  .length >
                                              0
                                      ? items[index]['product']['media'][0]
                                          ['src'][0]
                                      : 'images/emptywishlist.png',
                                  price: items[index]['product']['price'],
                                  id: items[index]['product']['_id'],
                                  quantity: items[index]['quantity'] ?? 1,
                                  setQuantity: updateCartItem,
                                  token: user.token,
                                  deleteFromCart: user.deleteFromCart,
                                  size: items[index]['size'],
                                  color: items[index]['color'],
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                      height: 160.0,
                                      color: Colors.white,
                                      child: CartPrice(
                                        length: items.length,
                                        price: price.toStringAsFixed(2),
                                        total: total.toStringAsFixed(2),
                                      )),
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
                      )))
            : Scaffold(
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(40.0),
                    child: FAppBar(
                      wishlist: true,
                      title: 'Cart',
                    )),
                backgroundColor:
                    Colors.white, //Theme.of(context).colorScheme.background,
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "You need to Login first",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    FRaisedButton(
                      bg: Theme.of(context).colorScheme.secondaryVariant,
                      text: 'Login',
                      color: Colors.white,
                      width: 150.0,
                      height: 40.0,
                      elevation: 0.5,
                      shape: true,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => UserPromptApp()));
                      },
                    )
                  ],
                ))));
  }
}
