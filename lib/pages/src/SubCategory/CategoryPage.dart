import 'package:esell/pages/src/SubCategory/subCategory.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String text;
  CategoryPage({this.text});
  @override
  Widget build(BuildContext context) {
    var CAT = text == 'top'
        ? TOP
        : text == 'bottom' ? BOTTOM : text == "foot" ? FOOT : WATCH_GLASSES;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: FAppBar(),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            childAspectRatio: 0.84,
          ),
          itemCount: CAT.length,
          itemBuilder: (BuildContext context, int index) {
            return SubCategory(
              cap: CAT[index]['cap'],
              src: CAT[index]['src'],
            );
          },
        );
      }),
    ));
  }
}
