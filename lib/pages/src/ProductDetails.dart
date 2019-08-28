import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:EsellGlobe/widget/productDetails/details.dart';
import 'package:EsellGlobe/store/ProductModel.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  ProductDetails({this.id});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context).one(id);
    List<Image> images = [];
    for(String src in product['media'][0]['src']){
      images.add(Image.network(src));
    }
    print(product);
    if (product['error'] != null)
      return Text('Error occured fetching product info!');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        persistentFooterButtons: <Widget>[PDFooter()],
        body: CustomScrollView(
          slivers: <Widget>[
            PDAppBar(images),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                PDInfo(name: product['name'], price: product['price'].toString(), details: product['description']),
                // PDPromo(),
                PDSizeSelector(),
                PDDetails(),
                // PDFeedback(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
