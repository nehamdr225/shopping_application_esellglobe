import 'package:esell/widget/atoms/StarRating.dart';
import 'package:flutter/cupertino.dart';
import 'package:esell/widget/productDetails/Stars.dart';
import 'package:flutter/material.dart';

class PDratingNreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Rate this app",
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline3),
      Text("Tell others what you think",
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.subtitle2),
      // PDStarRating(
      //   rating: 5,
      //   size: 34.0,
      // ), //working wala i will change the style later to look like belows.
      Stars(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        color: Theme.of(context).buttonColor,
        size: 34.0,
      ),//only for show
      InkWell(
        onTap: () {
          showDialog(context: context,
          builder: (BuildContext context) {
            return Container(
              height: 400.0,
              color: Theme.of(context).colorScheme.background,
              child: CupertinoAlertDialog(
                actions: [
                  Container(
                    height:100.0,
                    child: Text('HELLO')
                  )
                ],
              ),
            );
          });
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => 
          // ));
        },
        child: Text("Write a review",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Color(0xff3E91CC),
                )),
      )
    ]);
  }
}
