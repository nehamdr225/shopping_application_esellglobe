import 'package:esell/state/src/consts.dart';
import 'package:esell/widget/atoms/SubMainCards.dart';
import 'package:esell/widget/containers/ProductGrid.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final cat;
  CardView({this.cat});
  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      children: SubMain[cat] 
          .map(
            (category) => SubMainCards(
              image: category["image"],
              text: category["name"],
              height: 200.0,
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductGrid()),
                );
              },
            ),
          )
          .toList(),
    );
  }
}
