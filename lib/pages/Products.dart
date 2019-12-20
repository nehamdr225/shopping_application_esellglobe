import 'package:esell/widget/containers/ProductGrid.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/AppBar.dart';

class ProductsPage extends StatelessWidget {
  final category;
  ProductsPage({this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            cart: true,
            title: '${category[1]}',
          ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return ProductGrid(
            orientation: orientation,
            category: category,
          );
        }));
  }
}
