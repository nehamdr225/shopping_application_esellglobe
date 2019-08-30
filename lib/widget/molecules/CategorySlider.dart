import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Category.dart';
import 'package:flutter/material.dart';

class FSlider extends StatelessWidget {
  final products;
  FSlider({this.products});

  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Categories', style: Theme.of(context).textTheme.title),
          ),
          HorizontalList(),
        ],
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Category(
            name: MAIN[index]['name'],
            caption: MAIN[index]['cap'],
            src: MAIN[index]['src'],
          );
        },
      ),
    );
  }
}
