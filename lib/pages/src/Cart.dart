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
    var items = cart.cart;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: icontheme2),
          backgroundColor: Colors.white,
          title: Text(
            'My cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.pink,
              fontFamily: 'Ropa Sans',
            ),
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      //footer icon buttons
      persistentFooterButtons: <Widget>[
        ButtonTheme(
          minWidth: 165.0,
          height: 45.0,
          child: RaisedButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            onPressed: () {},
            child: Text('Total: ',
                style: TextStyle(
                    fontFamily: 'Victorian',
                    fontSize: 26.0,
                    color: Colors.black)),
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
            child: Text('Check Out',
                style: TextStyle(
                    fontFamily: 'Victorian',
                    fontSize: 26.0,
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
                  // size: each['size'],
                  // qty: each['quantity'],
                  // color: each['color'],
                );
              },
            )
          : Container(
            alignment: Alignment.center,
            child: Text("Your cart is empty!",
            style: TextStyle(fontSize: 24.0),),),
    ));
  }
}
