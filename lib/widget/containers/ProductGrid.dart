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
    print('Grid $category');
    final products = Provider.of<ProductModel>(context)
        .category(category.split(';').first, category.split(';').last);
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: products.length > 0
          ? GridView.builder(
              itemCount: products.length + 1,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 2,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return index != products.length
                    ? Product(
                        id: products[index].id,
                        category: category,
                        wishlist: true,
                      )
                    : BottomLoader();
              },
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width - 10,
                ),
              ],
            ),
    );
  }
}
