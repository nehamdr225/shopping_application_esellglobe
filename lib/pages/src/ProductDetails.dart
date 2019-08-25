import 'package:flutter/material.dart';

import 'package:EsellGlobe/widget/productDetails/AppBar.dart';
import 'package:EsellGlobe/widget/productDetails/Details.dart';
import 'package:EsellGlobe/widget/productDetails/Feedback.dart';
import 'package:EsellGlobe/widget/productDetails/Info.dart';
import 'package:EsellGlobe/widget/productDetails/Promo.dart';
import 'package:EsellGlobe/widget/productDetails/SizeSelector.dart';
import 'package:EsellGlobe/widget/productDetails/Footer.dart';
import 'package:provider/provider.dart';
import 'package:EsellGlobe/store/ProductModel.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  ProductDetails({this.id});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context).one(id);
    if (product['error'] != null)
      return Text('Error occured fetching product info!');
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[200],
            //footer icon buttons
            persistentFooterButtons: <Widget>[PDFooter()],
            body: CustomScrollView(slivers: <Widget>[
              PDAppBar(),
              SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  PDInfo(),
                  PDPromo(),
                  PDSizeSelector(),
                  PDDetails(),
                  PDFeedback(),
                ]),
              ),
            ])));
  }
}
