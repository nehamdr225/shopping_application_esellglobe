import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
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
        leading: Image.network(picture, width: 70.0, height: 90.0),
        title: Text(name),
        subtitle: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container( // quantity selector
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.minus_circled,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        color: Colors.white,
                        child: Text('1'),
                      ),
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.add_circled,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                IconButton(  // delete button
                  color: Theme.of(context).colorScheme.error,
                  splashColor: primary,
                  icon: Icon(
                    Icons.delete,
                  ),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: FancyText(
                                text: 'Remove from cart?',
                                size: 18.0,
                                textAlign: TextAlign.center,
                              ),
                              elevation: 2.0,
                              content: Container(
                                  alignment: Alignment.center,
                                  height: 70.0,
                                  width: 200.0,
                                  child: Text(
                                      'Are you sure you want to remove this product?')),
                              actions: <Widget>[
                                FRaisedButton(
                                  text: 'Remove',
                                  color: Colors.red,
                                  bg: Colors.red,
                                )
                              ],
                            ));
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 3.0, 3.0, 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('Size:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "N/A",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('Color:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text("N/A"),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(3.0),
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
