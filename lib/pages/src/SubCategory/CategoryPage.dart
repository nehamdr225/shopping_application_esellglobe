import 'package:esell/pages/src/SubCategory/subCategory.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String text;
  CategoryPage({this.text});
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final String text;
  _CategoryPageState({this.text});
  @override
  Widget build(BuildContext context) {
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
          itemCount: TOP.length,
          itemBuilder: (BuildContext context, int index) {
            switch (text) {
              case 'top':
                return SubCategory(
                  cap: TOP[index]['cap'],
                  src: TOP[index]['src'],
                );
                break;
              case 'bottom':
                return SubCategory(
                  cap: BOTTOM[index]['cap'],
                  src: BOTTOM[index]['src'],
                );
                break;
              case 'foot':
                return SubCategory(
                  cap: FOOT[index]['cap'],
                  src: FOOT[index]['src'],
                );
                break;
              case 'watchNglass':
                return SubCategory(
                  cap: WATCH_GLASSES[index]['cap'],
                  src: WATCH_GLASSES[index]['src'],
                );
                break;
              default:
                return SubCategory(
                  cap: TOP[index]['cap'],
                  src: TOP[index]['src'],
                );
            }
          },
        );
      }),
    ));
  }
}
