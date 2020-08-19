import 'package:esell/pages/CategoryPage.dart';
import 'package:esell/widget/atoms/Category.dart';
import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  GridList(
      {this.listViews, this.crossAxisCount, this.type, this.elevation: 1.0});
  final listViews;
  final type;
  final crossAxisCount;
  final elevation;
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
              elevation: elevation,
              child: Category( 
                name: listViews[index]['name'],
                caption: listViews[index]['cap'],
                src: listViews[index]['src'],
                style: Theme.of(context).textTheme.subtitle2,
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
