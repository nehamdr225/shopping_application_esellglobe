import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';

class InfoNavBar extends StatelessWidget {
  final type;
  final text;
  final size;
  final offerCard;
  final onPressed;
  final icon;
  const InfoNavBar(
      {Key key,
      this.type,
      this.text,
      this.size: 17.0,
      this.offerCard: false,
      this.onPressed,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: size, fontWeight: FontWeight.bold)),
          //    FancyText(
          //     text: text,
          //     //textColor: color.navColor,
          //     fontfamily: "Helvetica",
          //     size: size,
          //     textAlign: TextAlign.center,
          //     fontWeight: FontWeight.bold,
          //   ),
        ),
        icon ??
            IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: onPressed),
      ]),
    );
  }
}
