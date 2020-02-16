import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:flutter/material.dart';

class ContactUsCard extends StatelessWidget {
  final text;
  final buttonText;
  final capText;
  final onTap;
  final bool padding;
  ContactUsCard({
    this.text,
    this.buttonText,
    this.capText: '',
    this.onTap,
    this.padding: true,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == true
          ? const EdgeInsets.all(10.0)
          : const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
          padding: EdgeInsets.all(14.0),
          color: Colors.white,
          height: 180.0,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('$text',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                            'Feel free to talk to us about any queries or feedback. Customer satisfaction is our highest priority.',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                color: textColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w400)),
                        Text('$capText',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                color: Colors.grey[500],
                                fontSize: 11,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/icons/contactUs.png',
                    width: 70.0,
                  ),
                ],
              ),
              Divider(
                thickness: 1.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FRaisedButton(
                  text: '$buttonText',
                  color: primaryDark,
                  bg: Colors.white,
                  onPressed: onTap,
                  width: 200.0,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  height: 30.0,
                  elevation: 0.0,
                ),
              ),
            ],
          )),
    );
  }
}
