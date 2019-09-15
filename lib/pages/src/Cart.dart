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
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    var product = Provider.of<ProductModel>(context);
    var user = Provider.of<UserModel>(context);
    var items = cart.cart;
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(40.0),
                child: FAppBar(
                  wishlist: true,
                )),
            backgroundColor: Colors.white,
            //footer icon buttons
            persistentFooterButtons: <Widget>[
              ButtonTheme(
                minWidth: 165.0,
                height: 45.0,
                child: FRaisedButton(
                  text: "Total",
                 // bg: Colors.deepPurple,
                  color: icontheme,
                ),
              ),
              ButtonTheme(
                minWidth: 165.0,
                height: 45.0,
                child: RaisedButton(
                  color: icontheme2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  onPressed: () {},
                  child: Text(
                      user.token != null ? 'Check Out' : 'Login to checkout',
                      style: TextStyle(
                          fontFamily: 'Victorian',
                          fontSize: 18.0,
                          color: Colors.white)),
                ),
              ),
            ],
            body: cart.count > 0
                ? ListView.builder(
                    itemCount: cart.count,
                    itemBuilder: (context, index) {
                      var each = product.one(items[index]);
                      return CartListView(
                        name: each['name'],
                        picture: each['media'][0]['src'][0],
                        price: each['price'],
                      );
                    },
                  )
                : Center(
                  child:Column(
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
