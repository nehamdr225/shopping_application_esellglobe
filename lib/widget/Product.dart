import 'package:EsellGlobe/widget/atoms/Details.dart';
import 'package:EsellGlobe/widget/atoms/ImageHolder.dart';
import 'package:flutter/material.dart';
import '../pages/ProductDetails.dart';

class Product extends StatelessWidget {
  final name;
  final image;
  final seller;
  final price;
  final oldPrice;
  final details;

  Product(
      {this.name,
      this.price,
      this.seller,
      this.image,
      this.oldPrice,
      this.details});

  @override
  Widget build(BuildContext context) {

    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 150,
        height: 202.0,
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HeroDetails(
                        name: name,
                        image: image,
                        price: price,
                      )));
            },
            child: Column(
              children: <Widget>[
                ImageHolder(image: image),
                Divider(height: 1),
                Details(name:name, price: price,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
