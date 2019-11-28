import 'package:esell/state/state.dart';
import 'package:esell/state/src/consts.dart';
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
    final products = Provider.of<ProductModel>(context).category(cat);

  createWidgets() {
    List<Widget> widgets = [];
    SubMain[cat].forEach((each) {
      widgets.addAll([
        InfoNavBar(text: each['name']),
        Container(
            height: 170,
            alignment: Alignment.center,
            child: products.length > 0
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Product(
                        name: products[index]['name'],
                        image: products[index]['media'][0]['src']
                                            .length != 0
                                    ? Image.network(products[index]['media'][0]['src'][0], height: 100.0, width: 100.0,)
                                    : Image.asset(
                                        'images/SubMain/foot/casualshoes.jpg', height: 100.0, width: 100.0,),
                        imgheight: 120.0,
                        price: products[index]['price'],
                        id: products[index]['_id'],
                      );
                      
                      
                    })
                : CircularProgressIndicator()),
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
          child: FAppBar(wishlist: true, cart: true, title: Text('$text', style: TextStyle(color: textColor))),
        ),
        body: ListView(primary: false, children: createWidgets()),
      ),
    );
  }
}
