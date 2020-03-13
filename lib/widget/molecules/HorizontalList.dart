import 'package:esell/pages/CategoryPage.dart';
import 'package:esell/widget/atoms/Category.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final listViews;
  HorizontalList({this.listViews});
  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listViews.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              
            ),
            child: Category(
              name: listViews[index]['name'],
              caption: listViews[index]['name'],
              src: listViews[index]['src'],
              height: 40.0,
              width: 40.0,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoryPage(text: listViews[index]['cap']),
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

