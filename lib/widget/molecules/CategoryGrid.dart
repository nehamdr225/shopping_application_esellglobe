import 'package:esell/widget/containers/ProductGrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
    var products = product.products;
    return Container(
        height: 400.0,
        width: 300.0,
        color: Colors.white,
        child: OrientationBuilder(builder: (context, orientation) {
          return ProductGrid(
            orientation: orientation,
            products: products,
          );
        }));
  }
}
