//import 'package:esell/widget/atoms/ImageHolder.dart';
//import 'package:esell/widget/atoms/services.dart';
import 'dart:convert';

import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/productDetails/Carousel.dart';
import 'package:esell/widget/productDetails/TabView.dart';
//import 'package:esell/widget/productDetails/ColorSelector.dart';
//import 'package:esell/widget/productDetails/TabView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/widget/productDetails/details.dart';
import 'package:esell/state/state.dart';
//import 'dart:convert';

class ProductDetails extends StatefulWidget {
  final String id;
  ProductDetails({this.id});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String size = "S", color;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final product = Provider.of<ProductModel>(context).one(widget.id);

    List<Image> images = [];
    if (product['media'].length != 0 && product['media'][0]['src'] != null)
      for (String src in product['media'][0]['src']) {
        images.add(Image.network(src));
      }
    if (product['error'] != null)
      return Text('Error occured fetching product info!');
    return SafeArea(
      child: Scaffold(
        persistentFooterButtons: <Widget>[
          PDFooter(id: widget.id, quantity: quantity, size: size, color: color)
        ],
        backgroundColor: Colors.white,
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
                height: screenHeight * 0.40,
                width: screenWidth * 0.95,
                child: PDCarousel(images: images),
              ),
            ),
            PDInfo(
              name: product['name'],
              price: product['price'].toString(),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabView(
                  tabs: ['Styles', 'Details', 'Reviews'],
                  tabItems: <Widget>[
                    Text('Styles'),
                    PDDetails(
                        details: json.decode(product['description']),
                        price: product['price'].toString(),
                        colors: product['colors'],
                        sizes: json.decode(product['sizes'])),
                    Text('Reviews')
                  ],
                ))
          ],
        ),
        // body: CustomScrollView(
        //   slivers: <Widget>[
        //     images.length != 0
        //         ? PDAppBar(images)
        //         : SliverPadding(
        //             padding: EdgeInsets.all(0),
        //           ),
        //     SliverList(
        //       delegate: SliverChildListDelegate(<Widget>[
        //         PDInfo(
        //           name: product['name'],
        //         ),
        //         Padding(
        //           padding: EdgeInsets.only(top: 1.0),
        //         ),
        //         Services(),
        //         PDSizeSelector(),
        //         PDColorSelector(),
        //         PDDetails(
        //             details: json.decode(product['description']),
        //             price: product['price'].toString(),
        //             colors: product['colors'],
        //             sizes: json.decode(product['sizes']))
        //       ]),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
