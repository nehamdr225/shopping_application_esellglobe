import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';

class PDDetails extends StatelessWidget {
  final details;
  final price, colors, sizes;
  PDDetails({this.details, this.price, this.colors, this.sizes});
  @override
  Widget build(BuildContext context) {
    final body1 = Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0);
    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 8.0),
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Container(
                    child: FText(
                  text: "Product Details",
                  color: Theme.of(context).colorScheme.primaryVariant,
                  size: 20.0,
                )),
                Container(
                    child: FText(
                  text: "Material",
                  color: Theme.of(context).colorScheme.primaryVariant,
                  size: 18.0,
                )),
                Container(
                    child: FText(
                  text: details['material'],
                  style: body1,
                )),
                Container(
                    child: FText(
                  text: "Closure",
                  color: Theme.of(context).colorScheme.primaryVariant,
                  size: 18.0,
                )),
                Container(
                    child: FText(
                  text: details['closure'],
                  style: body1,
                )),
                Container(
                    child: FText(
                  text: "Warranty",
                  color: Theme.of(context).colorScheme.primaryVariant,
                  size: 18.0,
                )),
                Container(
                    child: FText(
                  text: details['warranty'],
                  style: body1,
                )),
                Container(
                    child: FText(
                  text: "Care Instructions",
                  color: Theme.of(context).colorScheme.primaryVariant,
                  size: 18.0,
                )),
                Container(
                    child: FText(
                  text: details['care_instructions'],
                  style: body1,
                )),
                Container(
                    child: FText(
                  text: "Details",
                  color: Theme.of(context).colorScheme.primaryVariant,
                  size: 18.0,
                )),
                Container(
                    child: FText(
                  text: details['details'],
                  style: body1,
                )),
                Container(
                    child: FText(
                  text: "Price",
                  color: Theme.of(context).colorScheme.primaryVariant,
                  size: 18.0,
                )),
                Container(
                    child: FText(
                  text: "Rs. $price",
                  style: body1,
                )),
                Container(
                    child: FText(
                  text: "Available Colors",
                  color: Theme.of(context).colorScheme.primaryVariant,
                  size: 18.0,
                )),
                Container(
                    child: FText(
                  text: colors,
                  style: body1,
                )),
                Container(
                    child: FText(
                  text: "Sizes",
                  color: Theme.of(context).colorScheme.primaryVariant,
                  size: 18.0,
                )),
                Container(
                    child: FText(
                  text: 'EU:  ${sizes['eu']}\nUK:  ${sizes['uk']}',
                  style: body1,
                )),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ]),
        ));
  }
}
