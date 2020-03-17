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
    print('Grid $gender');
    //final products = Provider.of<ProductModel>(context).category(gender);

    getCategoryItems(reqCategory) {
      String filter;
      if (reqCategory != 'Sunglasses' &&
          reqCategory != 'Watches' &&
          reqCategory != 'Bags & Backpacks')
        filter = [gender, cat].join(';');
      else
        filter = cat;
      print(filter);
      return Provider.of<ProductModel>(context).category(filter);
    }

    createWidgets() {
      Widget widgets;
      SubMain[cat].forEach((each) {
        final categoryProduct = getCategoryItems(each['name']);

        widgets = Container(
            height: 210,
            width: size.width *0.90,
            alignment: Alignment.center,
            child: categoryProduct.length > 0
                ? GridView.builder(
                    itemCount: categoryProduct.length - 1,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return index != categoryProduct.length
                          ? Product(
                              name: categoryProduct[index]['name'],
                              image: categoryProduct[index]['media'],
                              imgheight: 110.0,
                              price: categoryProduct[index]['price'],
                              details: categoryProduct[index]['description']
                                  ['style'],
                              id: categoryProduct[index]['_id'],
                              wishlist: true,
                              showDetails : false,
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
