import 'package:EsellGlobe/pages/Wishlist.dart';
import 'package:EsellGlobe/widget/Icons.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String name;
  final String price;
  Details({this.name, this.price});
  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;
    return Container(
        // height: 61,
        child: Column(
          children: <Widget>[
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
            Row(
              children: <Widget>[
              Expanded(child:
              Text(
                price,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                textAlign: TextAlign.center,
              )),
              Expanded(child:FIcons(
                  icon: Icons.bookmark_border,
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WishlistPage()));
                  }))
            ]),
          ],
        ));
  }
}
