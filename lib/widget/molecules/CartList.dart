import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  final name;
  final picture;
  final id;
  final size;
  final price;
  // final qty;
  final color;
  final quantity;
  final setQuantity;
  final token;
  final deleteFromCart;

  CartListView(
      {this.name,
      this.price,
      this.token,
      this.size,
      this.picture,
      this.id,
      this.quantity,
      this.setQuantity,
      this.deleteFromCart,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Container(
              child: Image.network(picture, width: 120.0, height: 120.0),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 6.0),
                    child: Text(
                      '\$',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.green),
                    ),
                  ),
                  Text(
                    "$price",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                  ),
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
                        size.toString() ?? "N/A",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text('Color:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(color ?? "N/A"),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.minus_circled,
                          color: Colors.black,
                          size: 25.0,
                        ),
                        onPressed: quantity > 1
                            ? () {
                                setQuantity(id, quantity - 1);
                              }
                            : null,
                      ),
                      Text(
                        quantity.toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.add_circled,
                          color: Colors.black,
                          size: 25.0,
                        ),
                        onPressed: () {
                          setQuantity(id, quantity + 1);
                        },
                      ),
                    ],
                  ),
                  IconButton(
                    // delete button
                    color: Theme.of(context).colorScheme.error,
                    splashColor: primary,
                    icon: Icon(
                      CupertinoIcons.delete_solid,
                    ),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          elevation: 2.0,
                          content: Container(
                              alignment: Alignment.center,
                              height: 70.0,
                              width: 200.0,
                              child: Text(
                                  'Are you sure you want to remove this product?')),
                          actions: <Widget>[
                            FRaisedButton(
                              shape: true,
                              text: 'Remove',
                              color: Colors.white,
                              bg: Colors.red,
                              onPressed: () {
                                deleteFromCart(id);
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
