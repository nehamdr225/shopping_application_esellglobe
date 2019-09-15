import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Category.dart';
import 'package:esell/widget/molecules/TopBrands.dart' as prefix0;
import 'package:flutter/material.dart';

class FSlider extends StatelessWidget {
  final text;
  final products;
  final type;
  FSlider({this.products, this.text, this.type});
//
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(text, style: Theme.of(context).textTheme.title),
          ),
          type == "MAIN"?
          HorizontalList():
          Specialoffers(),
        ],
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Category(
              name: MAIN[index]['name'],
              caption: MAIN[index]['cap'],
              src: MAIN[index]['src'],
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
      height: 100.0,
      width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: prefix0.SpecialOffers(
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
      height: 100.0,
      width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: prefix0.TopBrands(
              src: topBrands[index]['src'],
            ),
          );
        }, //
      ),
    );
  }
}
