import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Dropdown.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:esell/widget/containers/ProductGrid.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final String text;
  CategoryPage({this.text});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // print("height: $height");
    final product = Provider.of<ProductModel>(context);
    var cat = text == 'Top Wear'
        ? TOP
        : text == 'Bottom Wear'
            ? BOTTOM
            : text == "Foot Wear" ? FOOT : WATCH_GLASSES;
    List products = product.category(cat[2][0]);
    // print(products);
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: FAppBar(wishlist: true, cart: true),
            ),
            body: Container(
                height: height,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FText(
                            text: "Filter by:",
                            family: 'Ropa Sans',
                            size: 18.0,
                            padding: [15.0, 14.0],
                            color: Colors.deepPurple[900],
                          ),
                          DropDown(
                            cap: cat[0],
                            src: cat[1],
                          ),
                          DropDown(
                            cap: GENDER,
                            src: [],
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: height * (80 / 100),
                        child:
                            OrientationBuilder(builder: (context, orientation) {
                          return ProductGrid(
                              orientation: orientation,
                              products: products,
                              count: products.length);
                        }))
                  ],
                ))));
  }
}
