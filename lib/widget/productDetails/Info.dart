// import 'package:esell/state/src/theme.dart';
// import 'package:esell/widget/atoms/Text.dart';
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
      height: 150.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.0))),
      child: Card(
        elevation: 0.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.body1.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      color: Colors.grey[500])),
              Padding(
                padding: const EdgeInsets.only(top:5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("images/icons/rupee.png", height: 14.0,),
                    Padding(
                      padding: EdgeInsets.only(right: 6.0, left: 0.0),
                      child: Text(
                        "$price",
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 18.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 6.0, left: 6.0),
                      child: Text(
                        " 1800",
                        style: Theme.of(context).textTheme.body1.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                            color: Colors.grey[500],
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 6.0, left: 6.0),
                      child: Text(
                        "50% off",
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                              fontSize: 15.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  "Free Delivery",
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                        fontSize: 13.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:6.0),
                child: Row(
                  children: <Widget>[
                    Container(
                       width: 64.0,
                      height: 40.0,
                      child: Chip(
                        backgroundColor: Colors.green,
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '3.9',
                              style: Theme.of(context).textTheme.body1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                            ),
                            Icon(
                              Icons.star,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '15 ratings',
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500],
                              fontSize: 13.0,
                            ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
