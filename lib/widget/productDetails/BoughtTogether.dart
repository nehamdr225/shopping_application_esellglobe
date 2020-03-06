import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:esell/widget/productDetails/pdFBTtile.dart';
import 'package:flutter/material.dart';

class PDBoughtTogether extends StatelessWidget {
  final relevantProds;
  PDBoughtTogether({this.relevantProds});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Container(
                child: FText(
              text: "Frequently Bought Together",
              color: textColor,
              size: 16.0,
              fontWeight: FontWeight.w600,
            )),
            Column(
              children: <Widget>[
                FBTtile(
                  name: relevantProds[0]['name'],
                  image: relevantProds[0]['media']['front'],
                  price: relevantProds[0]['price'],
                ),
                FBTtile(
                  name: relevantProds[1]['name'],
                  image: relevantProds[1]['media']['front'],
                  price: relevantProds[1]['price'],
                ),
                FBTtile(
                  name: relevantProds[2]['name'],
                  image: relevantProds[2]['media']['front'],
                  price: relevantProds[2]['price'],
                ),
              ],
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
