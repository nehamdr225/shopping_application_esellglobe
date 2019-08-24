import 'package:flutter/material.dart';
import 'package:EsellGlobe/widget/AppBar.dart';
import 'package:EsellGlobe/SubCategory/SubCatSlider.dart';

class CategoryPage extends StatelessWidget {
  final products;
  CategoryPage({this.products});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: FAppBar(),
      ),
      body: Column(
        children: <Widget>[
          SubCatSlider(),
          
        ]
      ) ,
          
    );
  }
}