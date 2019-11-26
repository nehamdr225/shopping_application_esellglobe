import 'package:esell/state/state.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  Services(
      {this.payOnDelivery: true,
      this.replacement: true,
      this.amazonDelivery: true,
      this.aYearWarranty: true,
      this.contact});
  final bool payOnDelivery, replacement, amazonDelivery, aYearWarranty;
  final contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        payOnDelivery
            ? Column(children: [
                Icon(Icons.payment),
                Text(
                  'Pay on Delivery',
                  style: TextStyle(color: textColor),
                )
              ])
            : Text(''),
        replacement
            ? Column(children: [
                Icon(Icons.change_history),
                Text(
                  '10 Days Replacement',
                  style: TextStyle(color: textColor),
                )
              ])
            : Text(''),
        amazonDelivery
            ? Column(children: [
                Icon(Icons.directions_bus),
                Text(
                  'Amazon Delivered',
                  style: TextStyle(color: textColor),
                )
              ])
            : Text(''),
        aYearWarranty
            ? Column(children: [
                Icon(Icons.check_circle_outline),
                Text(
                  'Parking',
                  style: TextStyle(color: textColor),
                )
              ])
            : Text(''),
      ]
    );
  }
}
