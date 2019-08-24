import 'package:flutter/material.dart';

class PDPromo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
        height: 200.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))),
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  child: Column(children: [
                    Text(
                      "You pay only: Rs.2000",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Text(
                      "Apply the following coupon during checkout",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Apply Coupon",
                            style: Theme.of(context).textTheme.body2,
                            textAlign: TextAlign.center),
                        Text(
                          "ESELLGLOBE1000",
                          style: Theme.of(context).textTheme.title,
                        ),
                      ],
                    ),
                    Text(
                      "Coupon is only applicable on purchase greater than Rs. 1000",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Divider(),
                    Text("Exchange Policy",
                        style: Theme.of(context).textTheme.body2,
                        textAlign: TextAlign.center),
                    Text(
                      "Can be returned within 7 days of buying",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
