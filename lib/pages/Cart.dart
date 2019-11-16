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
            persistentFooterButtons: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(2.0),),
                  FRaisedButton(
                    width: 160.0,
                    text: "Total: ",
                    bg: icontheme,
                    shape: true,
                    color: textColor,
                    onPressed: () {},
                  ),
                  Padding(padding: EdgeInsets.all(8.0),),
                  FRaisedButton(
                    width: 160.0,
                    color: textColor,
                    shape: true,
                    bg: secondary,
                    onPressed: () {},
                    text: user.token != null ? 'Check Out' : 'Login to proceed',
                  ),
                  Padding(padding: EdgeInsets.all(2.0),),
                ],
              )
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
