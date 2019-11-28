import 'package:esell/widget/atoms/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/widget/productDetails/details.dart';
import 'package:esell/state/state.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  ProductDetails({this.id});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context).one(id);
    List<Image> images = [];
    if (product['media'][0]['src'] != null)
      for (String src in product['media'][0]['src']) {
        images.add(Image.network(src));
      }
    if (product['error'] != null)
      return Text('Error occured fetching product info!');
    return SafeArea(
      child: Scaffold(
        persistentFooterButtons: <Widget>[
          PDFooter(
            id: id,
          )
        ],
        backgroundColor: Colors.grey[100],
        body: CustomScrollView(
          slivers: <Widget>[
            images.length > 0
                ? PDAppBar(images)
                : SliverPadding(
                    padding: EdgeInsets.all(0),
                  ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                PDInfo(
                    name: product['name'],
                    price: product['price'].toString(),
                    details: product['description']),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Services(),
                PDSizeSelector(),
                PDDetails(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
