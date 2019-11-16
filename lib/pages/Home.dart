import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:esell/widget/molecules/Carousel.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:provider/provider.dart';
import 'package:esell/pages/Drawer.dart';

import 'package:esell/widget/molecules/HorizontalList.dart';

class HomePageApp extends StatefulWidget {
  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black87);
    //var screenWidth = MediaQuery.of(context).size.width;
    var user = Provider.of<UserModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(color: icontheme3,),
            backgroundColor: primary,
            actions: <Widget>[
              FIcons(
                icon: Icons.search,
                alignment: Alignment.centerRight,
                color: icontheme3,
                onPressed: () {},
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
        backgroundColor: Colors.grey[200],
        drawer: DrawerApp(),
        body: ListView(
          children: <Widget>[
            Container(
                color: Colors.white, child: HorizontalList(listViews: MAIN)),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            // Container(
            //   height: 100.0,
            //   width: screenWidth,
            //   child: Specialoffers(),
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 2.0),
              child: FancyText(
                text: 'Featured',
                fontfamily: 'Bree',
                size: 20.0,
                color: textColor,
              ),
            ),
            Container(height: 420, child: FCarousel()),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 2.0),
              child: FancyText(
                text: 'Top Brands',
                fontfamily: 'Bree',
                size: 20.0,
                color: textColor,
              ),
            ),
            Container(
                height: 100.0, child: HorizontalList(listViews: topBrands)),
            Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Image.asset('images/esell photo/8shoeshirt.jpeg'),
            ),
            Container(
              child: Image.asset('images/10poff.jpg'),
            ),
            //ProductContainer()
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
