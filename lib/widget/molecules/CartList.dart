import 'package:esell/entities/cart.dart';
import 'package:esell/entities/product.dart';
import 'package:esell/pages/CheckoutPage.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartListView extends StatelessWidget {
  final Product product;
  final color;
  final quantity;
  final setQuantity;
  final token;
  final deleteFromCart;
  final size;

  CartListView(
      {this.token,
      this.product,
      this.quantity,
      this.setQuantity,
      this.deleteFromCart,
      this.color,
      this.size});

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        top: 8.0,
      ),
      child: Container(
        height: 165.0,
        color: Theme.of(context).colorScheme.background,
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
                        Text(product.name,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0)),
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
                                    .bodyText2
                                    .copyWith(
                                        fontSize: 13.0,
                                        color: Colors.grey[600]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(size.toString() ?? "N/A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
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
                                      .bodyText2
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
                                      .bodyText2
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
                            Text('₹',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                    )),
                            Padding(
                              padding: EdgeInsets.only(right: 6.0, left: 6.0),
                              child: Text(
                                product.price,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        //
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CheckoutPage(
                                      items: [
                                        CartItem.fromJson({
                                          'product': product.toJson(),
                                          'quantity': quantity,
                                          'size': size,
                                          'color': color
                                        })
                                      ],
                                      total: double.parse(product.price
                                              .replaceAll(',', '')) *
                                          quantity,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Order Now",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                            ),
                            Row(
                              // quantity
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
                                          setQuantity(product.id, quantity - 1);
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
                                    setQuantity(product.id, quantity + 1);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        // FRaisedButton(
                        //   elevation: 0.0,
                        //   height: 40.0,
                        //   width: 140.0,
                        //   textAlign: TextAlign.left,
                        //   needIcon: true,
                        //   shape: false,
                        //   image: 'images/icons/save.png',
                        //   text: "Order Now",
                        //   fontSize: 14.0,
                        //   fontWeight: FontWeight.w600,
                        //   color: Theme.of(context).colorScheme.primary,
                        //   bg: Theme.of(context).colorScheme.background,
                        //   onPressed: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (_) => CheckoutPage(items: [
                        //                   CartItem.fromJson({
                        //                     'product': product,
                        //                     'quantity': quantity,
                        //                     'size': size,
                        //                     'color': color
                        //                   })
                        //                 ])));
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //image and qty
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.close, color: Colors.grey[500]),
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
                                    width: 120.0,
                                    onPressed: () {
                                      deleteFromCart(product.id);
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            );
                          }),
                      Container(
                        child: Image.network(
                            'https://api.shop2more.com' + product.media.front,
                            width: 100.0,
                            height: 90.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
