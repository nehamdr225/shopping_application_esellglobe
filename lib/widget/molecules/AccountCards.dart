import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:flutter/material.dart';

class AccountCards extends StatelessWidget {
  final text;
  final buttonText;
  final capText;
  final height;
  final onTap;
  final bool padding;
  AccountCards(
      {this.text,
      this.buttonText,
      this.capText: '',
      this.onTap,
      this.height: 110.0,
      this.padding: true});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical:15.0, horizontal: 20.0),
        child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('$text',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 15.0,
                              )),
                      Text('$capText',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.grey[500],
                              fontSize: 11,
                              fontWeight: FontWeight.w400)),
                    ]),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FRaisedButton(
                    text: 'View',
                    color: Theme.of(context).colorScheme.primary,
                    bg: Theme.of(context).colorScheme.background,
                    onPressed: onTap,
                    width: 70.0,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    height: 30.0,
                    elevation: 0.0,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ]));
  }
}
