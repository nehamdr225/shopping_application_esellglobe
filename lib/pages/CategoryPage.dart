import 'package:esell/state/state.dart';
import 'package:esell/state/src/consts.dart';
import 'package:esell/widget/atoms/BottomLoader.dart';
import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/Product.dart';
//import 'package:esell/widget/molecules/GridList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final String text;
  CategoryPage({this.text});
  @override
  Widget build(BuildContext context) {
    final cat = text == 'Top Wear'
        ? 'top'
        : text == 'Bottom Wear'
            ? 'bottom'
            : text == "Foot Wear" ? 'shoe' : 'glasses';

    getCategoryItems(reqCategory) {
      List<String> filter =
          reqCategory == 'slipper' ? [reqCategory] : [cat, reqCategory];
      return Provider.of<ProductModel>(context).category(filter);
    }

    createWidgets() {
      List<Widget> widgets = [];
      SubMain[cat].forEach((each) {
        final categoryProduct = getCategoryItems(each['cap'].toLowerCase());
        widgets.addAll([
          InfoNavBar(text: each['name'], type: each['cap']),
          Container(
              height: 250,
              width: 70,
              alignment: Alignment.center,
              child: categoryProduct.length > 0
                  ? GridView.builder(
                      itemCount: categoryProduct.length + 1,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return index != categoryProduct.length
                            ? Product(
                                name: categoryProduct[index]['name'],
                                image: categoryProduct[index]['media'][0]['src']
                                            .length >
                                        0
                                    ? categoryProduct[index]['media'][0]['src']
                                        [0]
                                    : null,
                                imgheight: 120.0,
                                price: categoryProduct[index]['price'],
                                seller: categoryProduct[index]['seller'],
                                oldPrice:
                                    categoryProduct[index]['oldPrice'] != null
                                        ? categoryProduct[index]['oldPrice']
                                        : categoryProduct[index]['price'],
                                details: categoryProduct[index]['details'],
                                id: categoryProduct[index]['_id'],
                                wishlist: true,
                              )
                            : BottomLoader();
                      },
                    )
                  : BottomLoader()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
          )
        ]);
      });
      return widgets;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(wishlist: true, cart: true, title: '$text'),
        ),
        body: ListView(primary: false, children: createWidgets()),
      ),
    );
  }
}
