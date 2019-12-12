import 'package:esell/pages/ProductDetails.dart';
import 'package:esell/widget/atoms/Details.dart';
import 'package:flutter/material.dart';

class SampleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 190.0,
        width: 150,
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Image.asset('images/esell photo/6white_rect.jpg')),
                Divider(height: 2),
                Details(
                  name: 'Tshirt',
                  price: 'Rs. 400',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
