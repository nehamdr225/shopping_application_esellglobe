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
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 8.0,),
      child: Container(
        height: 200.0,
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 16.0)),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Size:',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 13.0,
                                        color: Colors.grey[600]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(size.toString() ?? "N/A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.0,
                                            color: Colors.grey[600])),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Color:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0,
                                          color: Colors.grey[600]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Text(
                                  color ?? "N/A",
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0,
                                          color: Colors.grey[600]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('\$',
                                style:
                                    Theme.of(context).textTheme.body1.copyWith(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16.0,
                                        )),
                            Padding(
                              padding: EdgeInsets.only(right: 6.0, left: 6.0),
                              child: Text(
                                "$price",
                                style:
                                    Theme.of(context).textTheme.body1.copyWith(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16.0,
                                        ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 6.0, left: 6.0),
                              child: Text(
                                "\$ 1800",
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.0,
                                        color: Colors.grey[500],
                                        decoration: TextDecoration.lineThrough),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 6.0, left: 6.0),
                              child: Text(
                                "50% off",
                                style:
                                    Theme.of(context).textTheme.body1.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green,
                                          fontSize: 15.0,
                                        ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 6.0),
                          child: Text(
                            "Delivery by 02 Jan 2020",
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0,
                                ),
                          ),
                        ),

                        Text(
                          "Free Delivery",
                          style: Theme.of(context).textTheme.body1.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                                fontSize: 13.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column( //image and qty
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(picture,
                              width: 100.0, height: 70.0),
                        ),
                      ),
                      Row( // quantity
                        mainAxisAlignment: MainAxisAlignment.end,
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
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 1.0,),
            Row( //Buttons
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FRaisedButton(
                  elevation: 0.0,
                  height: 40.0,
                  width: width * 0.45,
                  needIcon: true,
                  shape: false,
                  image: 'images/icons/save.png',
                  text: "Save for later",
                  color: Colors.black87,
                  bg: Colors.white,
                  onPressed: () {},
                ),
                FRaisedButton(
                  elevation: 0.0,
                  height: 40.0,
                  width: width * 0.45,
                  needIcon: true,
                  shape: false,
                  image: 'images/icons/remove.png',
                  text: "Remove",
                  color: Colors.black87,
                  bg: Colors.white,
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
                            shape: false,
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
            SizedBox(height:4.0),
          ],
        ),
      ),
    );
  }
}
