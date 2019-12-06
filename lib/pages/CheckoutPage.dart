//import 'package:esell/state/src/theme.dart';
// import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductModel>(context);
    final user = Provider.of<UserModel>(context);
    final width = MediaQuery.of(context).size.width;
    var items = user.cart;
    return Scaffold(
      persistentFooterButtons: <Widget>[
        SizedBox(
          width: width - 20,
          child: RaisedButton(
            color: primary,
            child:
                Text('Place Order', style: Theme.of(context).textTheme.title),
            onPressed: () {},
          ),
        ),
      ],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            title: 'Checkout',
          )),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                InfoNavBar(
                  text: 'Billing details',
                  size: 18.0,
                  gotoproduct: false,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('House number, City, State, Country'),
                SizedBox(
                  height: 20.0,
                ),
                InfoNavBar(
                  text: 'Bill to default billing address',
                  size: 18.0,
                  gotoproduct: false,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 40.0,
                  width: width - 40.0,
                  child: FForms(
                    type: TextInputType.phone,
                    text: 'Enter your phone number',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 40.0,
                  width: width - 40.0,
                  child: FForms(
                    type: TextInputType.emailAddress,
                    text: 'Enter your email address',
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
          Divider(),
          Column(
              children: items.map<Widget>((fav) {
            final product = products.one(fav['product']);
            return Container(
              margin: EdgeInsets.only(top: 15),
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset.fromDirection(1, 1),
                      blurRadius: 1),
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset.fromDirection(-1, 1),
                      blurRadius: 1)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Image.network(
                        product['media'][0]['src'].length > 0
                            ? product['media']['src'][0]
                            : '',
                        height: 100.0,
                        width: 50.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          product['name'],
                          style: TextStyle(
                              fontFamily: "Helvetica",
                              color: textColor,
                              fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    color: Theme.of(context).colorScheme.error,
                    splashColor: primary,
                    icon: Icon(
                      Icons.remove_circle_outline,
                    ),
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: FancyText(
                                  text: 'Remove from cart?',
                                  size: 18.0,
                                  textAlign: TextAlign.center,
                                ),
                                elevation: 2.0,
                                content: Container(
                                    alignment: Alignment.center,
                                    height: 70.0,
                                    width: 200.0,
                                    child: Text(
                                        'Are you sure you want to remove this product?')),
                                actions: <Widget>[
                                  FRaisedButton(
                                    text: 'Remove',
                                    color: Colors.red,
                                    bg: Colors.red,
                                  )
                                ],
                              ));
                    },
                  )
                ],
              ),
            );
          }).toList()),
        ],
      ),
    );
  }
}
