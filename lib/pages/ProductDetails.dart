import 'package:flutter/material.dart';

import 'package:EsellGlobe/widget/productDetails/AppBar.dart';
import 'package:EsellGlobe/widget/productDetails/Details.dart';
import 'package:EsellGlobe/widget/productDetails/Feedback.dart';
import 'package:EsellGlobe/widget/productDetails/Info.dart';
import 'package:EsellGlobe/widget/productDetails/Promo.dart';
import 'package:EsellGlobe/widget/productDetails/SizeSelector.dart';
import 'package:EsellGlobe/widget/productDetails/Footer.dart';

class HeroDetails extends StatefulWidget {
  final String id;
  HeroDetails({this.id});
  @override
  _HeroDetailsState createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {
  final String id;
  _HeroDetailsState({this.id});
  @override
  Widget build(BuildContext context) {
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
