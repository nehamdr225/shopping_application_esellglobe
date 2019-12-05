import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  final name;
  final picture;
  // final size;
  final price;
  // final qty;
  // final color;

  CartListView({
    this.name,
    this.price,
    // this.size,
    this.picture,
    // this.qty,
    // this.color
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(picture, width: 60.0, height: 90.0),
        title: Text(name),
        subtitle: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.minus_circled,
                        color: Colors.black,
                        size: 19.0,
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      color: Colors.white,
                      width: 2.0,
                      child: Text('1'),
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.add_circled,
                        color: Colors.black,
                        size: 19.0,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  child: Text('Size:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.all(4.0),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "N/A",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Color:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("N/A"),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("Rs. $price",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            )
          ],
        ),
      ),
    );
  }
}
