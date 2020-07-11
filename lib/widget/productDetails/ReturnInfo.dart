import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';

class ReturnInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.bodyText1;
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
                    text: 'Easy 30 days return and exchanges',
                    size: 24.0,
                  )),
                  Container(
                      child: FText(
                    text:
                        'Choose to return or exchange to a diffferent size (if available) with in 30 days',
                    style: title,
                    //size: 18,
                  )),
                ],
              ),
            ]),
      ),
    );
  }
}
