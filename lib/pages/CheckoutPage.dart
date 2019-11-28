//import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Future _neverSatisfied(onPressed) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Rewind and remember'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text(
  //                 'Are you sure you want to delete this?',
  //                 style: TextStyle(color: textColor),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Cancel',
  //                 style: TextStyle(
  //                   fontSize: 16.0,
  //                 )),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           RaisedButton(
  //             color: errorColor,
  //             child: Text(
  //               'Delete',
  //               style: TextStyle(color: Colors.white, fontSize: 16.0),
  //             ),
  //             onPressed: () {
  //               onPressed();
  //               Navigator.of(context).pop();
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    //final ProductModel products = Provider.of<ProductModel>(context);
    //var cart = Provider.of<CartModel>(context);
    final user = Provider.of<UserModel>(context);
    //var items = cart.count;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            title: Text('Checkout'),
          )),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on),
                    Text('$user', style: Theme.of(context).textTheme.title,),
                    InkWell(
                      onTap: (){},
                      child: Text('EDIT', style: Theme.of(context).textTheme.body2,),
                    ),
                  ],
                ),
                Text('User Address', style: Theme.of(context).textTheme.title,),                
                Row(
                  children: <Widget>[
                    Icon(Icons.receipt),
                    Text('Bill to', style: Theme.of(context).textTheme.title,),
                    InkWell(
                      onTap: (){},
                      child: Text('EDIT', style: Theme.of(context).textTheme.body2,),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.phone),
                    FForms(
                    type: TextInputType.phone,
                    text: "Phone number",
                    obscure: false,
                    onChanged: (String x){
                      Navigator.pop(context);
                    }),
                // passwordErr != null
                //     ? Text(
                //         passwordErr,
                //         textAlign: TextAlign.center,
                //       )
                //     : Text(''),
                  ],
                ), 
                Row(
                  children: <Widget>[
                    Icon(Icons.email),
                    FForms(
                    type: TextInputType.emailAddress,
                    text: "Email Address",
                    obscure: false,
                    onChanged: (String x){
                      Navigator.pop(context);
                    }),
                // passwordErr != null
                //     ? Text(
                //         passwordErr,
                //         textAlign: TextAlign.center,
                //       )
                //     : Text(''),
                  ],
                ), 
              ],
            ),
          ),
          Divider(),
          // ListView(
          //   scrollDirection: Axis.vertical,
          //   children: items.length > 0
          //       ? items.map((fav) {
          //           final product = products.one(fav);
          //           return Container(
          //             margin: EdgeInsets.only(top: 15),
          //             height: 70.0,
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               boxShadow: [
          //                 BoxShadow(
          //                     color: Colors.black12,
          //                     offset: Offset.fromDirection(1, 1),
          //                     blurRadius: 1),
          //                 BoxShadow(
          //                     color: Colors.black12,
          //                     offset: Offset.fromDirection(-1, 1),
          //                     blurRadius: 1)
          //               ],
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: <Widget>[
          //                 Padding(
          //                   padding: EdgeInsets.all(3.0),
          //                   child: Image.network(product['media']['src'][0],
          //                   height: 100.0,
          //                   width: 100.0),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.only(left: 10.0),
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     crossAxisAlignment: CrossAxisAlignment.end,
          //                     children: <Widget>[
          //                       Text(
          //                         product['name'],
          //                         style: TextStyle(
          //                             fontFamily: "Helvetica",
          //                             color: textColor,
          //                             fontSize: 16.0),
          //                       ),
          //                       Text(
          //                         product['address'],
          //                         style: TextStyle(
          //                             fontFamily: "Helvetica",
          //                             color: textColor,
          //                             fontSize: 16.0),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 IconButton(
          //                   color: errorColor,
          //                   splashColor: primary,
          //                   icon: Icon(
          //                     Icons.remove_circle_outline,
          //                   ),
          //                   onPressed: () async {
          //                     //  await _neverSatisfied(() {
          //                     // //   user.removeFromFav(product['_id']);
          //                     // });
          //                   },
          //                 )
          //               ],
          //             ),
          //           );
          //         }).toList()
          //       : <Widget>[
          //           Container(
          //             height: MediaQuery.of(context).size.height * 0.7,
          //             alignment: Alignment.center,
          //             child: Text(
          //               "Your favourites list is empty.",
          //               style: TextStyle(
          //                   fontFamily: "Helvetica",
          //                   color: textColor,
          //                   fontSize: 16.0),
          //             ),
          //           ),
          //         ],
          // ),
        ],
      ),
    );
  }
}
