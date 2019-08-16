import 'package:flutter/material.dart';
import '../widget/appbar.dart';
import '../widget/products.dart';

class AllProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  AllProductsPage({this.products});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBarPage(),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return GridView.builder(
            itemCount: 20,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Product(
                  name: products[index]['name'],
                  image: products[index]['picture'],
                  price: products[index]['price'],
                  seller: products[index]['seller'],
                  oldPrice: products[index]['oldPrice'],
                  details: products[index]['details']);
            },
          );
        }));
  }
}
