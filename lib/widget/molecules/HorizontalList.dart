import 'package:esell/pages/CategoryPage.dart';
import 'package:esell/pages/genderSpecificPage.dart';
import 'package:esell/widget/atoms/Category.dart';
// import 'package:esell/widget/molecules/GridList.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  final listViews;
  final border;

  HorizontalList({
    this.listViews,
    this.border: false,
  });

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Align(
          child: Container(
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listViews.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: widget.border == true
                        ? Border.all(color: Colors.grey[200])
                        : null),
                child: Category(
                  name: widget.listViews[index]['name'],
                  caption: widget.listViews[index]['name'],
                  src: widget.listViews[index]['src'],
                  height: 28.0,
                  width: 28.0,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GenderSpecific(
                          gender: widget.listViews[index]['cap'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }, //
        ),
      ),
    );
  }
}

class GenderSpecHorizontalList extends StatefulWidget {
  final listViews;
  final border;

  GenderSpecHorizontalList({this.listViews, this.border: false});

  @override
  _GenderSpecHorizontalListState createState() =>
      _GenderSpecHorizontalListState();
}

class _GenderSpecHorizontalListState extends State<GenderSpecHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.0,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.listViews.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 150.0,
              decoration: BoxDecoration(
                  border: widget.border == true
                      ? Border.all(color: Colors.grey[200])
                      : null),
              child: Category(
                name: widget.listViews[index]['name'],
                caption: widget.listViews[index]['name'],
                src: widget.listViews[index]['src'],
                height: 40.0,
                width: 40.0,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        text: widget.listViews[index]['name'],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }, //
      ),
    );
  }
}
