import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';

class PDratingNreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FText(
                  text: "Ratings & Reviews",
                  color: textColor,
                  size: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: FRaisedButton(
                    elevation: 0.6,
                    width: 120.0,
                    text: 'Rate Product',
                    color: primaryDark,
                    fontSize: 14.0,
                    bg: Colors.white,
                    onPressed: (){},
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 6.0, left: 10.0, bottom: 6.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 65.0,
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
                                    fontSize: 14.0,
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
                        '15 ratings and 1 review',
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500],
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                  ],
                )),
            
          ],
        ),
      ),
    );
  }
}
