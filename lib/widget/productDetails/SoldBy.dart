import 'package:esell/state/state.dart';
// import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';

class PDsoldby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            FText(
              text: "Sold By",
              color: textColor,
              size: 18.0,
              fontWeight: FontWeight.w700,
            ),
            Row(
              children: <Widget>[
                FText(
                  text: "Shop 2 more",
                  color: primaryDark,
                  size: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                Container(
                  width: 55.0,
                  height: 40.0,
                  child: Chip(
                    backgroundColor: primaryDark,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '4',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
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
                          size: 13.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
            ),
          ],
        ),
      ),
    );
  }
}
