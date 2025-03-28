import 'package:esell/widget/atoms/Category.dart';
import 'package:flutter/material.dart';

class SubMainSlider extends StatelessWidget {
  final listViews;

  SubMainSlider({this.listViews});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 200.0,
      color: Colors.white,
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
                print(listViews[index]['name']);
              },
            ),
          );
        }, //
      ),
    );
  }
}
