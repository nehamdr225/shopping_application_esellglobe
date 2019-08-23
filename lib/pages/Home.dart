import 'package:EsellGlobe/helpers/Api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:EsellGlobe/widget/Carousel.dart';
import 'package:EsellGlobe/widget/colors.dart';
import 'package:EsellGlobe/widget/Icons.dart';
import 'package:EsellGlobe/pages/Drawer.dart';
import 'package:EsellGlobe/widget/CategorySlider.dart';
import 'package:EsellGlobe/widget/containers/Products.dart';
import 'package:provider/provider.dart';
import '../store/Models.dart';

class HomePageApp extends StatefulWidget {
  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black87);
    var screenHeight = MediaQuery.of(context).size.height;
    var product = Provider.of<ProductModel>(context);
    getProducts().then((data) {
      product.products = data;
    });
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
              expandedHeight: screenHeight * 0.30,
              actions: <Widget>[
                FIcons(
                  icon: Icons.search,
                  alignment: Alignment.centerRight,
                  color: icontheme,
                  onPressed: () {},
                ),
                FIcons(
                    icon: Icons.shopping_cart,
                    alignment: Alignment.centerRight,
                    color: icontheme,
                    onPressed: () {})
              ],
            ),
            FSlider(),
            ProductContainer(
                products: Provider.of<ProductModel>(context).products)
          ],
        ),
      ),
    );
  }
}

class Products {
  final String name;
  final String description;
  final String seller;
  final int price;
  final String category;
  final int stock;
  final int id;
  final List media;

  Products(
      {this.name,
      this.description,
      this.category,
      this.seller,
      this.price,
      this.id,
      this.media,
      this.stock});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        category: json['category'],
        description: json['description'],
        id: json['id'],
        media: json['media'],
        name: json['name'],
        price: json['price'],
        seller: json['seller'],
        stock: json['stock']);
  }
}
