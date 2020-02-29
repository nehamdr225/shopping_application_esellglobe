import 'package:esell/pages/CategoryPage.dart';
import 'package:esell/widget/atoms/Category.dart';
import 'package:flutter/material.dart';

class GridList extends StatelessWidget { 
  GridList({this.listViews, this.crossAxisCount, this.type});
  final listViews;
  final type;
  final crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          primary: false,
          physics: new NeverScrollableScrollPhysics(),
          itemCount: listViews.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Category(
                name: listViews[index]['name'],
                caption: listViews[index]['cap'],
                src: listViews[index]['src'],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                          text: listViews[index]['name'], type: type),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
