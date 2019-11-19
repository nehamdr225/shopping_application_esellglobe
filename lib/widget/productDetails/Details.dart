import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';

class PDDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.body2;
    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 8.0),
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Container(
              child: FText(
                text: "Product Details",
                family: 'Bree',
                size: 18.0,
                  )),
            Container(
              child: FText(
                text: "It is a three piece suit.",
                style: title,
                  )),
            Container(
              child: FText(
                text: "Size & Fit",
                family: 'Bree',
                size: 18.0,
                  )),
            Container(
              child: FText(
                text: "The model in the photo is of height: 6' 1'' and is wearing a size L" ,
                style: title,
                  )),
            Container(
              child: FText(
                text: "Material & Care" ,
                family: 'Bree',
                size: 18.0,
            )),
            Container(
              child: FText(
                text: "Suit Piece: 50% Cotton. It should be dry cleaned" ,
                style: title,
            )),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
          ]),
        ));
  }
}
