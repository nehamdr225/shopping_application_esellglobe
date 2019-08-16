import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import '../widget/Carousel.dart';
import '../widget/colors.dart';
import '../widget/Icons.dart';
import '../Drawer.dart';
import '../widget/horizontalLIST.dart';
import '../widget/productsPage.dart';

class EsellglobeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        drawer: DrawerApp(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.grey[200],
              floating: true,
              flexibleSpace: FCarousel(),
              expandedHeight: 200.0,
              actions: <Widget>[
                FIcons(icon: Icons.search, color: icontheme),
                FIcons(icon: Icons.shopping_cart, color: icontheme)
              ],
            ),
            FSlider(),
            Products(products: products)
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> products = [
  {
    "name": "Suit",
    "picture": "images/1.jpg",
    "price": "Rs. 1500",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 2800",
    "details": " it is a very nice product"
  },
  {
    "name": "Briefcase",
    "picture": "images/2.png",
    "price": "Rs. 1000",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1500",
    "details": " it is a very nice product"
  },
  {
    "name": "Shoes",
    "picture": "images/3.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Track suit",
    "picture": "images/4.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Track shoe",
    "picture": "images/5.jpeg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "brief case",
    "picture": "images/b2.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "T-Shirt",
    "picture": "images/s1.jpg",
    "price": "Rs. 500",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 800",
    "details": " it is a very nice product"
  },
  {
    "name": "Shoes",
    "picture": "images/o1.jpg",
    "price": "Rs. 1000",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1500",
    "details": " it is a very nice product"
  },
  {
    "name": "brief case",
    "picture": "images/b1.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Shirt",
    "picture": "images/s4.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Brief case",
    "picture": "images/b3.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Shoes",
    "picture": "images/o3.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "brief case",
    "picture": "images/b1.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Shirt",
    "picture": "images/s4.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Brief case",
    "picture": "images/b3.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Shoes",
    "picture": "images/o3.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "brief case",
    "picture": "images/b1.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Shirt",
    "picture": "images/s4.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Brief case",
    "picture": "images/b3.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  },
  {
    "name": "Shoes",
    "picture": "images/o3.jpg",
    "price": "Rs. 1300",
    "seller": " eSellglobe",
    "oldPrice": "Rs. 1800",
    "details": " it is a very nice product"
  }
];
