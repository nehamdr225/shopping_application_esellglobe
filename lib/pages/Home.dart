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
import '../store/ProductModel.dart';
import '../store/UserModel.dart';

class HomePageApp extends StatefulWidget {
  final String token;
  const HomePageApp({Key key, this.token}) : super(key: key);
  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);
    if (widget.token != null && widget.token != user.token)
      user.token = widget.token;
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
            ProductContainer(products: product.products,)
          ],
        ),
      ),
    );
  }
}
