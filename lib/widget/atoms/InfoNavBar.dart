import 'package:esell/pages/AddressPage.dart';
import 'package:esell/pages/Products.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';

class InfoNavBar extends StatelessWidget {
  final type;
  final text;
  final size;
  final offerCard;
  final bool gotoproduct;
  const InfoNavBar({Key key, this.type, this.text, this.size: 20.0, this.offerCard: false, this.gotoproduct: true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: FancyText(
            text: text,
            //textColor: color.navColor,
            fontfamily: "Ropa sans",
            size: size,
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: textColor,
          ),
          onPressed: () {
            gotoproduct == true
            ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductsPage(
                          category: type,
                        )))
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddressPage()));
          },
        ),
      ]),
    );
  }
}
