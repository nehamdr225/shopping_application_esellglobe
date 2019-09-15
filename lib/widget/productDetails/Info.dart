import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';
//import 'package:esell/widget/atoms/StarRating.dart';

class PDInfo extends StatelessWidget {
  final String name, details, color, price;
  PDInfo({this.name, this.price, this.details, this.color: "N/A"});

  @override
  Widget build(BuildContext context) {
    //final caption = Theme.of(context).textTheme.caption;
    final title = Theme.of(context).textTheme.body2;

    return Container(
      width: 360.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),

      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 1.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 5.0)),
                  Container(
                    child: FText(
                    text: name,
                    size: 24.0,
                  )),
                  Container(
                    child: FText(
                    text: details,
                    style: title,
                  )),
                  Container(
                    child: FText(
                    text: "Rs. $price",
                    style: title,
                  )),
                  Container(
                    child: FText(
                    text: "Available Colors: $color",
                    style: title,
                  )),

                  ///
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   //mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     FText(
                  //       text: 'Rate this item',
                  //       style: caption,
                  //     ),
                  //     PDStarRating(rating: 4.2),
                  //   ],
                  // )
                ],
              ),
            ]),
      ),
    );
  }
}
