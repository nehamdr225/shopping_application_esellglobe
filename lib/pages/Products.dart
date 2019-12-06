import 'package:esell/widget/containers/ProductGrid.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class ProductsPage extends StatelessWidget {
  final category;
  ProductsPage({this.category});
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).colorScheme.primaryVariant);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true, 
            cart: true,
            title: '$category',
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
