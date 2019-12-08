import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:esell/widget/molecules/GridList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/Carousel.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:provider/provider.dart';
import 'package:esell/pages/Drawer.dart';

class HomePageApp extends StatelessWidget {
  const HomePageApp(
      {Key key, this.searchBar, this.searchController, this.title});
  final searchBar;
  final searchController;
  final title;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var user = Provider.of<UserModel>(context);
    // FlutterStatusbarcolor.setStatusBarColor(color.primaryVariant);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            elevation: 0.0,
            title: Text('esellglobe',
                style: TextStyle(fontFamily: 'Bree', color: iconthemelight)),
            iconTheme: IconThemeData(
              color: iconthemelight,
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
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
          ),
        ),
        backgroundColor: color.background,
        drawer: DrawerApp(),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(3.0),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Container(
                  // decoration: BoxDecoration(
                  //     border: Border.all(width: 2.0, color: textColor),
                  //     borderRadius: BorderRadius.circular(5.0)),
                  height: 420,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: FCarousel(),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 8.0),
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
                listViews: WOMEN,
                crossAxisCount: 3,
              ),
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
