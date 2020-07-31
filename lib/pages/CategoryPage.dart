import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Products.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:esell/state/state.dart';
import 'package:esell/state/src/consts.dart';
import 'package:esell/widget/atoms/BottomLoader.dart';
import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/molecules/HorizontalList.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/widget/molecules/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  final String text;
  final String type;
  CategoryPage({this.text, this.type});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>   with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  // var _stockList = [];
  // ProductModel refProd = new ProductModel();
  @override
  Widget build(BuildContext context) {
    final cat = widget.text;

    getCategoryItems(reqCategory) {
      print(reqCategory);
      return Provider.of<ProductModel>(context).category(cat, reqCategory);
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
                        category: cat != 'Sunglasses' &&
                                cat != 'Watches' &&
                                cat != 'Bags & Backpacks'
                            ? [cat, each['name']].join(';')
                            : cat, //type
                      )));
        }
 
        widgets.addAll([
          InfoNavBar(
            text: each['name'],
            type: each['name'],
            onPressed: onpressed,
          ),
          Container(
              height: 310,
              width: 70,
              alignment: Alignment.center,
              child: categoryProduct.length > 0
                  ? GridView.builder(
                      itemCount: categoryProduct.length + 1,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return index != categoryProduct.length
                            ? Product(
                                imgheight: 210.0,
                                category: cat,
                                id: categoryProduct[index].id,
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
        
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0.5,
                title: Text("${widget.text}",
                    style: TextStyle(
                      color: primaryDark,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                iconTheme: IconThemeData(
                  color: primaryDark,
                ),
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                actions: <Widget>[
                  FIcons(
                      icon: Icons.shopping_cart,
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartPage()));
                      }),
                  FIcons(
                      icon: Icons.bookmark,
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WishlistPage()));
                      })
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(98.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 8.0),
                    child: Container( 
                        alignment: Alignment.center,
                        height: 80.0,
                        child: GenderSpecHorizontalList(
                          border: true,
                          listViews: MEN// widget.type == 'men' ? MEN : WOMEN,
                        )),
                  ),
                ),
              )
            ];
          },  

        body: ListView(primary: false, children: createWidgets()),
        //body: RefreshIndicator(child: ListView(primary: false, children: createWidgets()), onRefresh: _refreshPages,),
      ),)
    );
  }
//   Future<void> _refreshPages() async
//   {
//     print('refreshing product...');
//     // _stockList.forEach((s) async {
//     //   var product = await refProd.refresh();
//     //   setState(() {
//     //     s.price = product;
//     //   });
//     // });
//   }
}
