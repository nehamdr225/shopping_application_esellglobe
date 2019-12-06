import 'package:esell/state/state.dart';
import 'package:esell/state/src/consts.dart';
import 'package:esell/widget/atoms/BottomLoader.dart';
import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/molecules/AppBar.dart';
//import 'package:esell/widget/molecules/GridList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class CategoryPage extends StatelessWidget {
  final String text;
  CategoryPage({this.text});
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).colorScheme.primaryVariant);
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
              height: 170,
              alignment: Alignment.center,
              child: categoryProduct.length > 0
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryProduct.length,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 2.0,
                            child: InkWell(
                                onTap: () {},
                                child: Container(
                                    width: 150.0,
                                    child: ListTile(
                                      title: categoryProduct[index]['media'][0]
                                                      ['src']
                                                  .length !=
                                              0
                                          ? Image.network(
                                              categoryProduct[index]['media'][0]
                                                  ['src'][0],
                                              height: 100.0,
                                              width: 100.0,
                                            )
                                          : Image.asset(
                                              'images/SubMain/foot/casualshoes.jpg',
                                              height: 100.0,
                                              width: 100.0,
                                            ),
                                      contentPadding: EdgeInsets.all(1.0),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              categoryProduct[index]['name'],
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .body1
                                                  .copyWith(fontSize: 14.0),
                                            )),
                                      ),
                                    ))));
                      })
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
          child: FAppBar(
              wishlist: true,
              cart: true,
              title: '$text'),
        ),
        body: ListView(primary: false, children: createWidgets()),
      ),
    );
  }
}
