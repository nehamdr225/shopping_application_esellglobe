import 'package:esell/widget/atoms/Details.dart';
import 'package:esell/widget/atoms/ImageHolder.dart';
import 'package:flutter/material.dart';
import 'package:esell/pages/pages.dart';

class Product extends StatelessWidget {
  final name;
  final image;
  final double imgheight;
  final seller;
  final price;
  final oldPrice;
  final details;
  final id;

  Product(
      {this.name,
      this.price,
      this.seller,
      this.image,
      this.imgheight,
      this.oldPrice,
      this.details,
      this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 150,
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(id: id)));
            },
            child: Column(
              children: <Widget>[
                ImageHolder(image: image, imgheight: imgheight),
                Divider(height: 1),
                Details(
                  name: name,
                  price: 'Rs. $price',
                  id: id
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
