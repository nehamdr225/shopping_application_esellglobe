import 'package:esell/pages/Cart.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/Product.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductModel>(context);
    final wishlist = Provider.of<WishlistModel>(context);
    final items = wishlist.wishList;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            cart: true,
          ),
        ),
        backgroundColor: Colors.white,
        persistentFooterButtons: <Widget>[
          FRaisedButton(
              width: 160.0,
              color: icontheme,
              bg: icontheme2,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              text: 'Proceed to Cart'),
        ],
        body: wishlist.count() > 0
            ? Container(
                child: OrientationBuilder(builder: (context, orientation) {
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: wishlist.count(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var product = products.one(items[index]);
                      return Product(
                          id: product['_id'],
                          name: product['name'],
                          image: product['media'][0]['src'][0],
                          imgheight: 98.0,
                          price: product['price'],
                          seller: product['seller'],
                          details: product['description']);
                    },
                  );
                }),
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
                    "Oops..Your wishlist is empty!",
                    style: TextStyle(fontSize: 24.0),
                  ),
                ],
              )));
  }
}
