import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/Product.dart';
import 'package:esell/widget/atoms/centerText.dart';

class ProductsPage extends StatelessWidget {
  final products;
  ProductsPage({this.products});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return GridView.builder(
            itemCount: 5,
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
        }));
  }
}
