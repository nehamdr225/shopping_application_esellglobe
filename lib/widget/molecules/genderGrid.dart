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
    print('This is the category $cat');
    print('Grid $gender');
    //final products = Provider.of<ProductModel>(context).category(gender);

    getCategoryItems(reqCategory) {
      String filter;
      if (reqCategory != 'Sunglasses' &&
          reqCategory != 'Watches' &&
          reqCategory != 'Bags & Backpacks') {
        if (cat == 'Top Wear') {
          filter = [cat, 'Casual Shirts'].join(';');
        } else if (cat == 'Bottom Wear') {
          filter = [cat, 'Jeans Pants'].join(';');
        } else if (cat == 'Foot Wear') {
          filter = [cat, 'Casual Shoes'].join(';');
        }
      } else
        filter = cat;
      print(filter);
      return Provider.of<ProductModel>(context)
          .category(cat, filter.split(';').last);
    }

    createWidgets() {
      Widget widgets;
      SubMain[cat].forEach((each) {
        final categoryProduct = getCategoryItems(each['name']);

        widgets = Container(
            width: size.width * 0.90,
            alignment: Alignment.center,
            child: categoryProduct.length > 0
                ? GridView.builder(
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return index != categoryProduct.length
                          ? Product(
                              category: cat,
                              id: categoryProduct[index].id,
                              wishlist: true,
                              showDetails: false,
                            )
                          : BottomLoader();
                    },
                  )
                : BottomLoader());
      });
      return widgets;
    }

    return createWidgets();
  }
}
