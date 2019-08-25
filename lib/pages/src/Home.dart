import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:EsellGlobe/widget/Carousel.dart';
import 'package:EsellGlobe/widget/colors.dart';
import 'package:EsellGlobe/widget/Icons.dart';
import 'package:EsellGlobe/pages/pages.dart';
import 'package:EsellGlobe/widget/CategorySlider.dart';
import 'package:EsellGlobe/widget/containers/Products.dart';

class HomePageApp extends StatefulWidget {
  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  @override
  Widget build(BuildContext context) {
    print("built main");
    FlutterStatusbarcolor.setStatusBarColor(Colors.black87);
    var screenHeight = MediaQuery.of(context).size.height;
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
            ProductContainer()
          ],
        ),
      ),
    );
  }
}
