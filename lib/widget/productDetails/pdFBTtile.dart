import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';

class FBTtile extends StatelessWidget {
  final image;
  final name;
  final price;
  FBTtile({this.image, this.name, this.price});
  @override
  Widget build(BuildContext context) {
    final imagesrc = "https://api.shop2more.com" + image;
    final body1 = Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0);
    return Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 100.0,
              child: ListTile(
                leading: Image.network(
                  imagesrc,
                  fit: BoxFit.contain,
                  width: 90,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FText(
                      text: '$name',
                      style: body1.copyWith(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          "images/icons/rupee.png",
                          height: 14.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 6.0, left: 6.0),
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
                            "\$ 1800",
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
                  ],
                ),
              ),
            );
  }
}