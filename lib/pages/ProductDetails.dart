import 'dart:convert';
// import 'package:esell/widget/atoms/StarRating.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/productDetails/Carousel.dart';
import 'package:esell/widget/productDetails/ColorSelector.dart';
import 'package:esell/widget/productDetails/Offer.dart';
import 'package:esell/widget/productDetails/PDratingNreview.dart';
// import 'package:esell/widget/productDetails/TabView.dart';
import 'package:esell/widget/productDetails/delivery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/widget/productDetails/details.dart';
import 'package:esell/state/state.dart';

class ProductDetails extends StatefulWidget {
  final String id;
  ProductDetails({this.id});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String color;
  int quantity = 1, size;

  void setSize(int newSize) {
    if (newSize != size)
      setState(() {
        size = newSize;
      });
  }

  void setColor(String newColor) {
    if (newColor != color)
      setState(() {
        color = newColor;
      });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final product = Provider.of<ProductModel>(context).one(widget.id);

    List<Image> images = [];
    if (product['media']['front'].length > 0) {
      images.add(Image.network(product['media']['front']));
    }
    if (product['media']['back'].length > 0) {
      images.add(Image.network(product['media']['back']));
    }
    if (product['media']['left'].length > 0) {
      images.add(Image.network(product['media']['left']));
    }
    if (product['media']['right'].length > 0) {
      images.add(Image.network(product['media']['right']));
    }
    if (product['media']['top'].length > 0) {
      images.add(Image.network(product['media']['top']));
    }
    if (product['media']['bottom'].length > 0) {
      images.add(Image.network(product['media']['bottom']));
    }
    // Map<String, dynamic> images;
    //  = {
    //   'front': '',
    //   'back': '',
    //   'left': '',
    //   'right': '',
    //   'top': '',
    //   'bottom': ''
    // };
    if (product['error'] != null)
      return Text('Error occured fetching product info!');
    return SafeArea(
      child: Scaffold(
        persistentFooterButtons: <Widget>[
          PDFooter(id: widget.id, quantity: quantity, size: size, color: color)
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            title: "",
            cart: true,
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Container(
                height: screenHeight * 0.45,
                width: screenWidth,
                child: PDCarousel(
                  images: images,
                  id: widget.id,
                  width: screenWidth,
                ),
              ),
            ),
            PDInfo(
              name: product['name'],
              price: product['price'].toString(),
            ),
            PDoffer(),
            PDSizeSelector(
              sizes: json.decode(product['sizes']),
              setSize: setSize,
            ),
            PDColorSelector(color: product['colors'], setColor: setColor),
            PDdelivery(),
            PDDetails(
                details: json.decode(product['description']),
                price: product['price'].toString(),
                colors: product['colors'],
                sizes: json.decode(product['sizes'])),
            PDratingNreview(),
            Padding(
              padding: EdgeInsets.all(10.0),
            )
            // Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: TabView(
            //       tabs: ['Styles', 'Details', 'Reviews'],
            //       tabItems: <Widget>[
            //         Column(
            //           children: <Widget>[
            //
            //             PDSizeSelector(
            //               sizes: json.decode(product['sizes']),
            //               setSize: setSize,
            //             ),
            //           ],
            //         ),
            //         PDDetails(
            //             details: json.decode(product['description']),
            //             price: product['price'].toString(),
            //             colors: product['colors'],
            //             sizes: json.decode(product['sizes'])),
            //         PDStarRating(
            //           rating: 5.0,
            //         )
            //       ],
            //     ))
          ],
        ),
      ),
    );
  }
}
