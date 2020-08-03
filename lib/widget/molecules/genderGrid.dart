import 'package:esell/widget/atoms/BottomLoader.dart';
import 'package:esell/widget/molecules/Product.dart';
import 'package:flutter/material.dart';

import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class GenderGrids extends StatelessWidget {
  final String gender;
  final crossAxisCount;
  final cat;
  GenderGrids({this.gender, this.crossAxisCount, this.cat});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    getCategoryItems() => Provider.of<ProductModel>(context).category(cat, '');

    createWidgets() {
      Widget widgets;
      SubMain[cat].forEach((each) {
        final categoryProduct = getCategoryItems();

        widgets = Container(
          width: size.width * 0.95,
          alignment: Alignment.center,
          child: categoryProduct != null
              ? categoryProduct.length > 0
                  ? GridView.builder(
                      itemCount: 2,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Product( 
                          category: cat,
                          id: categoryProduct[index].id,
                          wishlist: true,
                          showDetails: false,
                        );
                      },
                    )
                  : BottomLoader(category: cat)
              : BottomLoader(category: cat, isNull: true),
        );
      });
      return widgets;
    }

    return createWidgets();
  }
}
