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
    var preview = '';
    if (image != null) {
      if (image['front'] == null) {
        if (image['left'] != null) {
          preview = image['left'];
        } else if (image['right'] != null) {
          preview = image['right'];
        } else if (image['back'] != null) {
          preview = image['back'];
        } else if (image['top'] != null) {
          preview = image['top'];
        } else if (image['bottom'] != null) {
          preview = image['bottom'];
        }
      } else {
        preview = image['front'];
      }
    }
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
                  image: preview,
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
