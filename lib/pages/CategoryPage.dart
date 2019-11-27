import 'package:esell/state/state.dart';
import 'package:esell/state/src/consts.dart';
import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/molecules/AppBar.dart';
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
              height: 180,
              alignment: Alignment.center,
              child: products.length > 0
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              products[index]['media'][0]['src'].length != 0
                                  ? Image.network(
                                      products[index]['media'][0]['src'][0])
                                  : Image.asset(
                                      'images/SubMain/foot/casualshoes.jpg'),
                              Text(products[index]['name'],
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      // backgroundColor: Colors.white,
                                      fontSize: 14.0))
                            ],
                          ),
                        );
                      },
                    )
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
          child: FAppBar(wishlist: true, cart: true),
        ),
        body: ListView(primary: false, children: createWidgets()),
      ),
    );
  }
}
