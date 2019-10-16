import 'package:esell/pages/pages.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Category.dart';
import 'package:esell/widget/molecules/TopBrands.dart';
import 'package:flutter/material.dart';


class HorizontalList extends StatelessWidget {
  final listViews;
  HorizontalList({this.listViews});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listViews.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Category(
              name: listViews[index]['name'],
              caption: listViews[index]['cap'],
              src: listViews[index]['src'],
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoryPage(text: listViews[index]['name']),
                  ),
                );
              },
            ),
          );
        }, //
      ),
    );
  }
}

class Specialoffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.0,
      // width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: SpecialOffers(
              src: specialOffers[index]['src'],
            ),
          );
        }, //
      ),
    );
  }
}

class Topbrands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: TopBrands(
              src: topBrands[index]['src'],
            ),
          );
        }, //
      ),
    );
  }
}
