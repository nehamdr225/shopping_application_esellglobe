import 'package:flutter/material.dart';
import '../pages/ProductDetails.dart';
import '../pages/Wishlist.dart';

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
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
            height: 150,
            width: 150.0,
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
                    // IconButton(
                    //   alignment: Alignment.bottomRight,
                    //   icon: Icon(Icons.bookmark_border),
                    //   onPressed: (){},
                    // ),
                    Container(
                        // alignment: Alignment.bottomLeft,
                        height: 10.0,
                        child: Row(
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 65.0),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.bookmark_border,
                                size: 12.0,
                              ),
                              alignment: Alignment.topRight,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WishlistPage()));
                              },
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        height: 5.0,
                        child: Text(details)),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        height: 5.0,
                        child: Text(price)),
                  ],
                ),
              ),
            )));
  }
}
