import 'package:esell/pages/CheckoutPage.dart';
import 'package:esell/pages/UserPromt.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/CartList.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';
//import '../widget/appbar.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List items = [];
  List sizes = [];
  List colors = [];
  num price = 1000.0;

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductModel>(context);
    var user = Provider.of<UserModel>(context);
    setState(() {
      items = user.cart;
      print(items);
    });

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(2.0),
                  ),
                  FRaisedButton(
                    width: 160.0,
                    text: "Total: ",
                    bg: iconthemelight,
                    shape: true,
                    color: textColor,
                    onPressed: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  FRaisedButton(
                    width: 160.0,
                    color: Colors.white,
                    shape: true,
                    bg: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      user.token != null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckoutPage(
                                        items: items,
                                        price: price,
                                      )))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserPromptApp()));
                    },
                    text: user.token != null ? 'Check Out' : 'Login to proceed',
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                  ),
                ],
              )
            ],
            body: items.length > 0
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
                              deleteFromCart: user.deleteFromCart)
                          : CircularProgressIndicator();
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
                  ))));
  }
}
