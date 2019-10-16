import 'package:esell/widget/atoms/centerText.dart';
import 'package:esell/widget/molecules/Product.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:esell/state/state.dart';

class ProductGrid extends StatelessWidget {
  final Orientation orientation;
  final List products;
  final int count;
  ProductGrid({this.orientation, this.products, this.count});
  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<ProductModel>(context);
    return GridView.builder(
      itemCount: count,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: 0.84,
      ),
      itemBuilder: (BuildContext context, int index) {
        // final products = product.products;
        return products != null
            ? products.length > 0
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
                : CenterText(
                    text: 'Products are being loaded...',
                    size: 12.0,
                    indicator: true,
                  )
            : CenterText(
                text: 'Products are being loaded...',
                size: 12.0,
                indicator: true,
              );
      },
    );
  }
}
