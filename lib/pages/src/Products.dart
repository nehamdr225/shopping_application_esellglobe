import 'package:esell/widget/containers/ProductGrid.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    final product = Provider.of<ProductModel>(context);
    var products = product.products;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(wishlist: true, cart: true),
        ),
        body: ProductGrid(
              orientation: orientation,
              products: products,
              count: product.count)
        );
  }
}
