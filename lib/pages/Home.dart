import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/state.dart';
//import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:esell/widget/molecules/GridList.dart';
import 'package:esell/widget/molecules/HorizontalList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/Carousel.dart';
//import 'package:esell/widget/molecules/colors.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:provider/provider.dart';
import 'package:esell/pages/Drawer.dart';

class HomePageApp extends StatefulWidget {
  const HomePageApp(
      {Key key, this.searchBar, this.searchController, this.title});
  final searchBar;
  final searchController;
  final title;

  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    //var color = Theme.of(context).colorScheme;
    var user = Provider.of<UserModel>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        drawer: DrawerApp(),
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Image.asset('images/logo/logoonly1.png'),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                iconTheme: IconThemeData(
                  color: primaryDark,
                ),
                backgroundColor: Colors.white,
                actions: <Widget>[
                  FIcons(
                    icon: Icons.search,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                  ),
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
                        user.token != null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WishlistPage()))
                            : _showBottomSheet(context);
                      })
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: FForms(
                      height: 35.0,
                      width: width * 0.90,
                      text: 'Search for fashion',
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              )
            ];
          },
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Container(
                    height: height * 0.55,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: FCarousel(),
                    )),
              ),
              Container(
                  height: 80.0,
                  padding: EdgeInsets.all(7.0),
                  //width: 30.0,
                  child: HorizontalList(
                    listViews: HList,
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 8.0),
                child: FancyText(
                  text: "Discounts for you",
                  size: 20.0,
                  color: textColor,
                  textAlign: TextAlign.start,
                  fontfamily: "Bree",
                ),
              ),
              Container(
                    height: height * 0.40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Image.asset(
                        'images/myntra images/scroll1.jpg'
                      ),
                    )),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 8.0),
                child: FancyText(
                  text: "Men's Fashion",
                  size: 20.0,
                  color: textColor,
                  textAlign: TextAlign.start,
                  fontfamily: "Bree",
                ),
              ),
              Container(
                height: 250.0,
                child: GridList(
                  type: 'men',
                  listViews: MEN,
                  crossAxisCount: 3,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 8.0),
                child: FancyText(
                  text: "Women's Fashion",
                  size: 20.0,
                  color: textColor,
                  fontfamily: "Bree",
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                height: 250.0,
                child: GridList(
                  type: 'women',
                  listViews: WOMEN,
                  crossAxisCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.centerRight,
                    color: primary,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Center(
                        child: Image.asset(
                      'images/logo/logoonly1.png',
                      height: 60.0,
                      width: 60.0,
                    )),
                  ),
                  Container(
                    // buttons
                    child: LoginOptions(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
