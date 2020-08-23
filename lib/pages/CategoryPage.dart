import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:esell/state/state.dart';
import 'package:esell/state/src/consts.dart';
import 'package:esell/widget/atoms/BottomLoader.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/Category.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/widget/molecules/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  final String text;
  final String type;
  CategoryPage({this.text, this.type});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _tabController = new TabController(
      length: SubMain[widget.text].length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.text);
    getCategoryItems(reqCategory) {
      return Provider.of<ProductModel>(context)
          .category(widget.text, reqCategory);
    }

    final user = Provider.of<UserModel>(context);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0.5,
                title: Text(
                  "${widget.text}",
                  style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.bold),
                  // TextStyle(
                  //   color: Colors.black,
                  //   fontSize: 18.0,
                  //   fontWeight: FontWeight.bold,
                  // )
                ),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                iconTheme: IconThemeData(
                  color: primaryDark,
                ),
                backgroundColor: Colors.white,
                leading: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.back,
                        color: Colors.black,
                      ),
                      Text(
                        "Back",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                actions: <Widget>[
                  FIcons(
                      icon: Image.asset(
                        "images/esellIcons/cart2.png",
                        height: 20.0,
                        width: 20.0,
                      ),
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        user.token != null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()))
                            : _showBottomSheet(context);
                      }),
                  FIcons(
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Colors.black,
                      ),
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        user.token != null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WishlistPage()))
                            : _showBottomSheet(context);
                      })
                ],
                bottom: isSingleView(widget.text)
                    ? PreferredSize(
                        preferredSize: Size.fromHeight(0),
                        child: SizedBox.shrink(),
                      )
                    : PreferredSize(
                        preferredSize: Size.fromHeight(88.0),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0.0, top: 8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 80.0,
                            child: TabBar(
                              indicatorColor:
                                  Theme.of(context).colorScheme.secondary,
                              isScrollable: true,
                              controller: _tabController,
                              // indicator: BoxDecoration(),
                              tabs: SubMain[widget.text]
                                  .map<Widget>(
                                    (e) => Category(
                                      name: e['name'],
                                      caption: e['name'],
                                      src: e['src'],
                                      height: 40.0,
                                      width: 40.0,
                                      onTap: null,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
              )
            ];
          },
          body: isSingleView(widget.text)
              ? Builder(
                  builder: (context) {
                    final items = getCategoryItems(widget.text);
                    return GridView.builder(
                      itemCount: items.length + 1,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        if (items.length == 0)
                          return BottomLoader(
                            category: widget.text,
                            isNull: true,
                          );
                        return index != items.length
                            ? Product(
                                imgheight: 210.0,
                                category: widget.text,
                                id: items[index].id,
                                wishlist: true,
                              )
                            : BottomLoader(
                                category: widget.text,
                              );
                      },
                    );
                  },
                )
              : TabBarView(
                  controller: _tabController,
                  children: SubMain[widget.text].map<Widget>((e) {
                    final items = getCategoryItems(e['name']);
                    return GridView.builder(
                      itemCount: items.length + 1,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        if (items.length == 0)
                          return BottomLoader(
                            category: [widget.text, e['name']].join(';'),
                            isNull: true,
                          );
                        return index != items.length
                            ? Product(
                                imgheight: 210.0,
                                category: widget.text,
                                id: items[index].id,
                                wishlist: true,
                              )
                            : BottomLoader(
                                category: [widget.text, e['name']].join(';'),
                              );
                      },
                    );
                  }).toList(),
                )),
    ));
  }

  _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              height: 300.0,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.centerRight,
                    color: Theme.of(context).colorScheme.primary,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  LoginOptions(),
                ],
              ),
            ),
          );
        });
  }
}

bool isSingleView(String category) {
  if (category.contains('Sunglasses') ||
      category.contains('Bags & Backpacks') ||
      category.contains('Watches')) return true;
  return false;
}
