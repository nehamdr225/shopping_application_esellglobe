import 'package:esell/entities/product.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:esell/widget/productDetails/pdFBTtile.dart';
import 'package:flutter/material.dart';

class PDBoughtTogether extends StatelessWidget {
  final List<Product> relevantProds;
  PDBoughtTogether({this.relevantProds});
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
            Container(
                child: FText(
              text: "You might also like",
              color: textColor,
              size: 16.0,
              fontWeight: FontWeight.w600,
            )),
            Column(
              children: relevantProds
                  .map<Widget>(
                    (e) => FBTtile(
                      name: e.name,
                      image: e.media.front,
                      price: e.price,
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
