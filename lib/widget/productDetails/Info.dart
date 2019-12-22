import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';
//import 'package:esell/widget/atoms/StarRating.dart';

class PDInfo extends StatelessWidget {
  final String name, price;
  PDInfo({this.name, this.price});

  @override
  Widget build(BuildContext context) {
    //final caption = Theme.of(context).textTheme.caption;
    //var width = MediaQuery.of(context).size.width;

    return Container(
      //width: width*0.80,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.0))),
      child: Card(
        elevation: 0.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FText(
              text: name,
              color: textColor,
              size: 18.0,
            ),
            FText(
              text: "Rs. $price",
              style: TextStyle(
                fontSize: 18.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
