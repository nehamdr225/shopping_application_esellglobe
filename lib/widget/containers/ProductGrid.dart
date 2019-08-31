import 'package:esell/widget/atoms/centerText.dart';
import 'package:esell/widget/molecules/Product.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final Orientation orientation;
  final List products;
  final int count;
  ProductGrid({this.orientation, this.products, this.count});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: count,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: 0.84,
      ),
      itemBuilder: (BuildContext context, int index) {
        return products != null
            ? Product(
                name: products[index]['name'],
                image: products[index]['media'][0]['src'].length > 0
                    ? products[index]['media'][0]['src'][0]
                    : null,
                price: products[index]['price'],
                seller: products[index]['seller'],
                oldPrice: products[index]['oldPrice'],
                details: products[index]['details'])
            : CenterText(
                text: 'Products are being loaded...',
                size: 12.0,
                indicator: true,
              );
      },
    );
  }
}
