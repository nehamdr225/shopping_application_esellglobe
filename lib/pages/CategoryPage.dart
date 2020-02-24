import 'package:esell/pages/Products.dart';
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
  final String type;
  CategoryPage({this.text, this.type});
  @override
  Widget build(BuildContext context) {
    final cat = text;

    getCategoryItems(reqCategory) {
      String filter;
      if (reqCategory != 'Sunglasses' &&
          reqCategory != 'Watches' &&
          reqCategory != 'Bags & Backpacks')
        filter = [cat, reqCategory].join(';');
      else
        filter = cat;
      print(filter);
      return Provider.of<ProductModel>(context).category(filter);
    }

    createWidgets() {
      List<Widget> widgets = [];
      SubMain[cat].forEach((each) {
        final categoryProduct = getCategoryItems(each['name']);
        onpressed() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductsPage(
                        category: [cat, each['name']].join(';'), //type
                      )));
        }

        widgets.addAll([
          InfoNavBar(
            text: each['name'],
            type: each['name'],
            onPressed: onpressed,
          ),
          Container(
              height: 270,
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
                                image: categoryProduct[index]['media'],
                                imgheight: 150.0,
                                price: categoryProduct[index]['price'],
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
