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
      height: 200.0,
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
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0,
                      color: Colors.grey[800])),
              Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Table(
                    children: [
                      TableRow(children: [
                        Text(
                          "Price",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                              color: Colors.grey[500]),
                        ),
                        Text(':', textAlign: TextAlign.center, style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0,
                              color: Colors.grey[800]),),
                        Text(
                          "₹ 1800",
                          style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0,
                              color: Colors.grey[500],
                              decoration: TextDecoration.lineThrough),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                          child: Text(
                            "After discount ",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                          child: Text(':',  textAlign: TextAlign.center, style: Theme.of(context).textTheme.body1.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                                color: Colors.grey[800]),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:2.0, bottom: 4.0),
                          child: Text(
                            "₹ $price",
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17.0,
                                ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                          child: Text(
                            "You save",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                          child: Text(':', textAlign: TextAlign.center,style: Theme.of(context).textTheme.body1.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                                color: Colors.grey[800]),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:2.0, bottom: 2.0),
                          child: Text(
                            "50% off",
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green,
                                  fontSize: 15.0,
                                ),
                          ),
                        ),
                      ])
                    ],
                  )),
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
                padding: const EdgeInsets.only(top: 6.0),
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
                            Icon(
                              Icons.star,
                              size: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.all(1.0),
                            ),
                            Text(
                              '3.9',
                              style: Theme.of(context).textTheme.body1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '15 ratings and 1 review',
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
