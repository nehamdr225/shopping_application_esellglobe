import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/Category.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:esell/widget/molecules/GridList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/Carousel.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:provider/provider.dart';
import 'package:esell/pages/Drawer.dart';

import 'genderSpecificPage.dart';

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
                title: Image.asset(
                  'images/logo/logoonly.png',
                  color: Colors.black,
                  height: 24.0,
                ),
                leading: Builder(builder: (BuildContext context) {
                  return InkWell(
                    child: Image.asset("images/esellIcons/menu.png"),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                }),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                actions: <Widget>[
                  FIcons(
                    icon: Icon(Icons.search),
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                  ),
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
                      icon: Icon(Icons.bookmark_border),
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
                  preferredSize: Size.fromHeight(60.0),
                  child: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: FForms(
                      height: 45.0,
                      width: width * 0.90,
                      formColor: Theme.of(context).colorScheme.onBackground,
                      borderColor: Theme.of(context).colorScheme.onBackground,
                      borderRadius: 30.0,
                      text: 'Search for fashion',
                      labeltext: false,
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
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Category(
                          name: "Men",
                          caption: "Mens",
                          src: "images/icons/man.png",
                          height: 28.0,
                          width: 28.0,
                          style: Theme.of(context).textTheme.headline3,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => GenderSpecific(
                                  gender: "Male",
                                ),
                              ),
                            );
                          },
                        ),
                        Category(
                          name: "Women",
                          caption: "Womens",
                          src: "images/icons/woman.png",
                          height: 28.0,
                          width: 28.0,
                          style: Theme.of(context).textTheme.headline3,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => GenderSpecific(
                                  gender: "Female",
                                ),
                              ),
                            );
                          },
                        ),
                      ])),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                child: Text(
                  "SPECIAL DISCOUNTS",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                  height: height * 0.40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Image.asset('images/myntra images/scroll1.jpg'),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 8.0),
                child: Text(
                  "Men's Fashion",
                  style: Theme.of(context).textTheme.headline4,
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
                child:Text("Women's Fashion", style: Theme.of(context).textTheme.headline4,),),
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
              height: 350.0,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.centerRight,
                    color: primaryDark,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  BrandLogos(
                    height: 90.0,
                    width: 90.0,
                  ),
                  LoginOptions(),
                ],
              ),
            ),
          );
        });
  }
}
