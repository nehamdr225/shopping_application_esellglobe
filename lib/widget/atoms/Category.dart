import 'package:esell/pages/src/SubCategory/CategoryPage.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String src;
  final caption;
  final String name;

  Category({this.caption, this.src, this.name});

  @override
  Widget build(BuildContext context) {
    pusher(text) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CategoryPage(text: text),
        ),
      );
    }

    return Padding(
        padding: EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            switch (name) {
              case "top":
                pusher("top");
                break;
              case "bottom":
                pusher("bottom");
                break;
              case "foot":
                pusher("foot");
                break;
              case "watchNglass":
                pusher("watchNglass");
                break;
            }
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
