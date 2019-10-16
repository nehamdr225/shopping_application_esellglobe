import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String src;
  final caption;
  final String name;
  final Function onTap;

  Category({this.caption, this.src, this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
              width: 100.0,
              child: ListTile(
                title: Image.asset(
                  src,
                  width: 70.0,
                  height: 70.0,
                ),
                contentPadding: EdgeInsets.all(1.0),
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
