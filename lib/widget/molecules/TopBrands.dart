import 'package:esell/pages/pages.dart';
import 'package:flutter/material.dart';

class TopBrands extends StatelessWidget {
  final String src;
  final caption;
  final String name;

  TopBrands({this.caption, this.src, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryPage(text: name),
              ),
            );
          },
          child: Container(
            width: 100.0,
            child: Image.asset(
              src,
              width: 170.0,
              height: 270.0,
            ),
          ),
        ));
  }
}

class SpecialOffers extends StatelessWidget {
  final String src;
  final caption;
  final String name;

  SpecialOffers({this.caption, this.src, this.name});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryPage(text: name),
              ),
            );
          },
          child: Container(
            width: width,
            child: Image.asset(
              src,
            ),
          ),
        ));
  }
}
