import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodSize;
  final prodPrice;
  final prodQuantity;
  final prodColor;

  CartListView(
      {this.prodName,
      this.prodPrice,
      this.prodSize,
      this.prodPicture,
      this.prodQuantity,
      this.prodColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(prodPicture, width: 80.0, height: 80.0),
        title: Text(prodName),
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
                    prodSize,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Color:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(prodColor),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(prodPrice,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            )
          ],
        ),
      ),
    );
  }
}
