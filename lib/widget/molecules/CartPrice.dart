import 'package:flutter/material.dart';

class CartPrice extends StatefulWidget {
  final length;
  final price;
  final total;
  final deliveryPrice;
  CartPrice({this.length, this.price, this.total, this.deliveryPrice: 65.0});

  @override
  _CartPriceState createState() => _CartPriceState();
}

class _CartPriceState extends State<CartPrice> {
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Order (${widget.length} item)',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 14.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '₹  ${widget.price}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 15.0),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Delivery Fee',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 14.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '₹  ${widget.deliveryPrice}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 15.0),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Total Amount',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 15.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '₹  ${widget.total}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16.0),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
