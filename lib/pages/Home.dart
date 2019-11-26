import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:esell/widget/molecules/GridList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:esell/widget/molecules/Carousel.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:provider/provider.dart';
import 'package:esell/pages/Drawer.dart';

class HomePageApp extends StatelessWidget {
  const HomePageApp({Key key, this.searchBar, this.searchController, this.title});
  final searchBar;
  final searchController;
  final title;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(primary);
    var user = Provider.of<UserModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            elevation: 0.0,
            title: Text('esellglobe',
                style: TextStyle(fontFamily: 'Bree', color: textColor)),
            iconTheme: IconThemeData(
              color: icontheme3,
            ),
            backgroundColor: primary,
            actions: <Widget>[
              FIcons(
                icon: Icons.search,
                alignment: Alignment.centerRight,
                color: icontheme3,
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
                  color: icontheme3,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  }),
              FIcons(
                  icon: Icons.bookmark,
                  alignment: Alignment.centerRight,
                  color: icontheme3,
                  onPressed: () {
                    user.token != null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WishlistPage()))
                        : _showBottomSheet(context);
                  })
            ],
          ),
        ),
        backgroundColor: bgcolor,
        drawer: DrawerApp(),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(3.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: textColor),
                  borderRadius: BorderRadius.circular(5.0)
                ),
                height: 420, 
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: FCarousel(),
                )
               
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 2.0),
              child: FancyText(
                text: "Men's Fashion",
                size: 20.0,
                color: textColor,
              ),
            ),
            Container(
              height: 250.0,
              child: GridList(listViews: MEN, crossAxisCount: 3,),
            ),
            Padding(
               padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 2.0),
              child: FancyText(
                text: "Women's Fashion",
                size: 20.0,
                color: textColor,
              ),
            ),
            Container(
              height: 250.0,
              child: GridList(listViews: WOMEN, crossAxisCount: 3,),
            ),
          ],
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
              height: 330.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      // close button
                      height: 30.0,
                      width: 30.0,
                      padding: EdgeInsets.only(top: 0.0),
                      child: IconButton(
                        color: icontheme3,
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Container(
                    // logo
                    height: 60.0,
                    padding: EdgeInsets.only(top: 0.0, bottom: 10.0),
                    child: ListTile(
                      title: Center(
                          child: Image.asset(
                        'images/logo/logoonly1.png',
                        height: 60.0,
                        width: 50.0,
                      )),
                    ),
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
