//import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductModel>(context);
    final user = Provider.of<UserModel>(context);
    var items = user.cart;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            title: Text('Checkout'),
          )),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          // Card(
          //   child: Column(
          //     children: <Widget>[
          //       Row(
          //         children: <Widget>[
          //           Icon(Icons.location_on),
          //           Text(
          //             'Here is name',
          //             style: Theme.of(context).textTheme.title,
          //           ),
          //           InkWell(
          //             onTap: () {},
          //             child: Text(
          //               'EDIT',
          //               style: Theme.of(context).textTheme.body2,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Text(
          //         'User Address',
          //         style: Theme.of(context).textTheme.title,
          //       ),
          //       Row(
          //         children: <Widget>[
          //           Icon(Icons.receipt),
          //           Text(
          //             'Bill to',
          //             style: Theme.of(context).textTheme.title,
          //           ),
          //           InkWell(
          //             onTap: () {},
          //             child: Text(
          //               'EDIT',
          //               style: Theme.of(context).textTheme.body2,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         children: <Widget>[
          //           Icon(Icons.phone),
          //           FForms(
          //               type: TextInputType.phone,
          //               text: "Phone number",
          //               obscure: false,
          //               onChanged: (String x) {
          //                 Navigator.pop(context);
          //               }),
          //         ],
          //       ),
          //       Row(
          //         children: <Widget>[
          //           Icon(
          //             Icons.email,
          //             size: 20,
          //           ),
          //           FForms(
          //               type: TextInputType.emailAddress,
          //               text: "Email Address",
          //               obscure: false,
          //               onChanged: (String x) {
          //                 Navigator.pop(context);
          //               }),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          Divider(),
          Column(
              children: items.map<Widget>((fav) {
                final product = products.one(fav);
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
                            width: 100.0),
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
                                  fontSize: 16.0),
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
                        onPressed: () async {},
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
