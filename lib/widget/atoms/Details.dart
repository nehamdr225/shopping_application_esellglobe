import 'package:esell/state/state.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  final String name;
  final String price;
  final String id;
  Details({this.name, this.price, this.id});
  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistModel>(context);

    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
        ),
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          textAlign: TextAlign.center,
        ),
        Row(children: <Widget>[
          Expanded(
              child: Text(
            price,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: FIcons(
                  icon: Icons.bookmark_border,
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    wishlist.find(id) != true
                        ? wishlist.setOne = id
                        : print("already in wishlist");
                  }))
        ]),
      ],
    ));
  }
}
