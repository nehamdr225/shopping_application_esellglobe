import 'package:esell/pages/pages.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String src;
  final caption;
  final String name;

  Category({this.caption, this.src, this.name});

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
              width: 90.0,
              child: ListTile(
                title: Image.asset(
                  src,
                  width: 100.0,
                  height: 35.0,
                ),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    caption,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Ropa Sans', fontSize: 12.0),
                  ),
                ),
              )),
        ));
  }
}
