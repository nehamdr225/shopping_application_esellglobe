import 'package:esell/widget/atoms/BottomLoader.dart';
import 'package:esell/widget/molecules/Product.dart';
import 'package:flutter/material.dart';

import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final Orientation orientation;
  final String category;
  ProductGrid({this.orientation, this.category});
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductModel>(context).category(category);
    return products.length > 0
        ? GridView.builder(
            itemCount: products.length + 1,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              childAspectRatio: 0.84,
            ),
            itemBuilder: (BuildContext context, int index) {
              return index != products.length
                  ? Product(
                      name: products[index]['name'],
                      image: products[index]['media'][0]['src'].length > 0
                          ? products[index]['media'][0]['src'][0]
                          : null,
                      imgheight: 130.0,
                      price: products[index]['price'],
                      seller: products[index]['seller'],
                      oldPrice: products[index]['oldPrice'] != null
                          ? products[index]['oldPrice']
                          : products[index]['price'],
                      details: products[index]['details'],
                      id: products[index]['_id'])
                  : BottomLoader();
            },
          )
        : Row(
            children: <Widget>[CircularProgressIndicator()],
          );
  }
}
