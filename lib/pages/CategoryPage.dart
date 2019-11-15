import 'package:esell/state/state.dart';
import 'package:esell/widget/containers/ProductGrid.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/SubMainSlider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final String text;
  CategoryPage({this.text});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final product = Provider.of<ProductModel>(context);
    final cat = text == 'Top Wear'
        ? SubMain['top']
        : text == 'Bottom Wear'
            ? SubMain['bottom']
            : text == "Foot Wear" ? SubMain['shoes'] : SubMain['glasses'];
    List products = product.category(MAPPER[text]);

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: FAppBar(wishlist: true, cart: true),
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  child: SubMainSlider(
                    listViews: cat,
                  ),
                ),
                Padding(padding: EdgeInsets.all(12.0),),
                Container(
                    height: height * (80 / 100),
                    child: OrientationBuilder(builder: (context, orientation) {
                      return ProductGrid(
                        orientation: orientation,
                        products: products,
                      );
                    }))
              ],
            )));
  }
}
