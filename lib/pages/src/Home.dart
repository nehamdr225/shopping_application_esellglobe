import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:esell/widget/molecules/Carousel.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/pages/pages.dart';
import 'package:esell/widget/molecules/CategorySlider.dart';
import 'package:esell/widget/containers/Products.dart';

class HomePageApp extends StatefulWidget {
  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    }),
                FIcons(
                    icon: Icons.bookmark,
                    alignment: Alignment.centerRight,
                    color: icontheme,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WishlistPage()));
                    })
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
