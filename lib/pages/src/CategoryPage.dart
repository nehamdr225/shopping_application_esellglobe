import 'package:esell/state/state.dart';
// import 'package:esell/widget/atoms/Dropdown.dart';
// import 'package:esell/widget/atoms/Text.dart';
import 'package:esell/widget/containers/ProductGrid.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/CategorySlider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final String text;
  CategoryPage({this.text});
  @override
  Widget build(BuildContext context) {
    print(text);
    var height = MediaQuery.of(context).size.height;
    // print("height: $height");
    final product = Provider.of<ProductModel>(context);
    var cat = text == 'Top Wear'
        ? TOP
        : text == 'Bottom Wear'
            ? BOTTOM
            : text == "Foot Wear" ? FOOT : WATCH_GLASSES;
    List products = product.category(text);
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: FAppBar(wishlist: true, cart: true),
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  child: HorizontalList(
                    type: cat,
                  ),
                ),
                Container(
                    height: height * (80 / 100),
                    child: OrientationBuilder(builder: (context, orientation) {
                      return ProductGrid(
                          orientation: orientation,
                          products: products,
                          count: products.length);
                    }))
              ],
            )));
  }
}
