import 'package:esell/widget/atoms/Details.dart';
import 'package:esell/widget/atoms/ImageHolder.dart';
import 'package:flutter/material.dart';
import 'package:esell/pages/ProductDetails.dart';

class Product extends StatelessWidget {
  final name;
  final image;
  final double imgheight;
  final price;
  final details;
  final id;
  final wishlist;

  Product(
      {this.name,
      this.price,
      this.image,
      this.imgheight,
      this.details,
      this.wishlist,
      this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(id: id)));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ImageHolder(
                  image: image,
                  imgheight: imgheight,
                ),
                Divider(height: 2),
                Details(
                  name: name,
                  price: 'Rs. $price',
                  id: id,
                  wishlist: wishlist,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
