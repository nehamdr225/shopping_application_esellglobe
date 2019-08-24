import 'package:flutter/material.dart';

class PDDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
        height: 250.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))),
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Text(
              "Product Details",
              style: Theme.of(context).textTheme.body2,
              textAlign: TextAlign.left,
            ),
            Text(
              "It is a three piece suit...",
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Text(
              "Size & Fit",
              style: Theme.of(context).textTheme.body2,
              textAlign: TextAlign.left,
            ),
            Text(
              "The models (height: 6'1'') is wearing a size L ",
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Text(
              "Material & Care",
              style: Theme.of(context).textTheme.body2,
              textAlign: TextAlign.left,
            ),
            Text(
              "Suit Piece: 50% Cotton\n Dry Cleaning",
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.left,
            ),
          ]),
        ));
  }
}
