import 'package:EsellGlobe/widget/atoms/Text.dart';
import 'package:flutter/material.dart';

import 'package:EsellGlobe/widget/productDetails/StarRating.dart';

class PDInfo extends StatelessWidget {
  final String name, details, color, price;
  PDInfo({this.name, this.price, this.details, this.color:"N/A"});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))),
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                  ),
                  FText(text: name),
                  Padding(
                    padding: EdgeInsets.only(right: 40.0),
                  ),
                  Column(
                    children: [
                      FText(
                        text: 'Rate this item',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      PDStarRating(rating: 4.2),
                    ],
                  )
                ],
              ),
              Divider(
                color: Colors.black26,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: Table(children: [
                    TableRow(children: [
                      FText(
                        text: "Price",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      FText(
                        text: "Rs. $price\n  ",
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ]),
                    TableRow(children: [
                      FText(
                        text: "Color",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Text(
                        "$color \n ",
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Text(
                        details,
                        style: TextStyle(
                            fontFamily: 'Ropa Sans',
                            fontSize: 18.0,
                            color: Colors.grey[700]),
                      ),
                      // Text('It is a 3 piece suit.  ',
                      // style: TextStyle(
                      //   fontFamily: 'Ropa Sans',
                      //   fontSize: 18.0,
                      // color: Colors.grey[700]), ) ,
                    ]),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
