import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';
//import 'package:esell/widget/atoms/StarRating.dart';

class PDInfo extends StatelessWidget {
  final String name, details;
  PDInfo({this.name, this.details});

  @override
  Widget build(BuildContext context) {
    //final caption = Theme.of(context).textTheme.caption;
    //var width = MediaQuery.of(context).size.width;

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
                    color: Theme.of(context).colorScheme.primaryVariant,
                    size: 24.0,
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
