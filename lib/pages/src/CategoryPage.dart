import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Dropdown.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String text;
  CategoryPage({this.text});
  @override
  Widget build(BuildContext context) {
    var cat = text == 'top'
        ? TOP
        : text == 'bottom' ? BOTTOM : text == "foot" ? FOOT : WATCH_GLASSES;
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: FAppBar(),
            ),
            body:  DropDown(
              cap: cat[0],
              src: cat[1],
            )));
  }
}
