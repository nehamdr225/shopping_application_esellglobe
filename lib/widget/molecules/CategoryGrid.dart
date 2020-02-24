import 'package:esell/widget/containers/ProductGrid.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500.0,
        width: 300.0,
        color: Colors.white,
        child: OrientationBuilder(builder: (context, orientation) {
          return ProductGrid( 
            orientation: orientation,
          );
        }));
  }
}
