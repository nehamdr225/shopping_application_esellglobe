import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  final name;
  final picture;
  // final size;
  final price;
  // final qty;
  // final color;

  CartListView(
      {this.name,
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
        leading: Image.network(picture, width: 80.0, height: 80.0),
        title: Text(name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  child: Text('Size:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.all(8.0),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "N/A",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Color:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
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
