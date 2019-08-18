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
    var screenHeight = MediaQuery.of(context).size.height / 100;
    var screenWidth = MediaQuery.of(context).size.width / 100;
    return Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
            height: screenHeight * 30,
            width: screenWidth * 35,
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
                      height: screenHeight * 10,
                      width: screenWidth * 35,
                      child: Image.asset(image),
                    ),
                    Divider(),
                    Container(
                        // alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(left: screenWidth * 5.0),
                        height: screenHeight * 3,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: screenWidth * 15,
                              alignment: Alignment.topLeft,
                              child: Text(
                                name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(
                                  Icons.bookmark_border,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => WishlistPage()));
                                },
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.5),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: screenWidth * 5.0),
                        alignment: Alignment.bottomLeft,
                        height: screenHeight * 1.5,
                        child: Text(
                          price,
                          textAlign: TextAlign.left,
                        )),
                  ],
                ),
              ),
            )));
  }
}
