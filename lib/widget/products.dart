import 'package:flutter/material.dart';
import '../pages/productdetail.dart';

class Product extends StatelessWidget {
  final name;
  final image;
  final seller;
  final price;
  final oldPrice;

  Product({this.name, this.price, this.seller, this.image, this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
            height: 30.0,
            width: 100.0,
            padding: EdgeInsets.all(1.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
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
                    Container(
                      height: 100.0,
                      child: Image.asset(image),
                    ),
                    Divider(),
                    Container(
                        alignment: Alignment.bottomCenter,
                        height: 5.0,
                        child: Text(name)),
                  ],
                ),
              ),
            )));
  }
}
