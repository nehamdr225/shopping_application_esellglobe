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
import 'package:esell/pages/Drawer.dart';

import 'package:esell/widget/molecules/HorizontalList.dart';

class HomePageApp extends StatefulWidget {
  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            height: 310.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  // close button
                  height: 10.0,
                  padding: EdgeInsets.only(top: 0.0),
                  child: ListTile(
                    trailing: IconButton(
                      color: Colors.deepPurple[900],
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Container(
                  // logo
                  height: 50.0,
                  padding: EdgeInsets.only(top: 0.0, bottom: 10.0),
                  child: ListTile(
                    title: Center(
                        child: Image.asset(
                      'images/logo/logoonly1.png',
                      height: 50.0,
                      width: 50.0,
                    )),
                    // trailing: IconButton(
                    //   color: Colors.transparent,
                    //   icon: Icon(Icons.close),
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                  ),
                ),
                Container(
                  // buttons
                  child: LoginOptions(),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black87);
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        //bottomSheet: _showBottomSheet(context),//showBottomSheet(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple[900],
          child: Icon(Icons.account_box),
          onPressed: () {
            _showBottomSheet(context);
          },
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.deepPurple[900]),
            backgroundColor: Colors.white,
            actions: <Widget>[
              FIcons(
                icon: Icons.search,
                alignment: Alignment.centerRight,
                color: icontheme2,
                onPressed: () {},
              ),
              FIcons(
                  icon: Icons.shopping_cart,
                  alignment: Alignment.centerRight,
                  color: icontheme2,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  }),
              FIcons(
                  icon: Icons.bookmark,
                  alignment: Alignment.centerRight,
                  color: icontheme2,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WishlistPage()));
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
            Container(
              height: 100.0,
              width: screenWidth,
              child: Specialoffers(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 2.0),
              child: FancyText(
                text: 'Featured',
                fontfamily: 'Bree',
                size: 20.0,
                color: Colors.deepPurple[900],
              ),
            ),
            Container(height: 420, child: FCarousel()),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              child: Image.asset('images/myntra images/sc/hero0.jpg'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 2.0),
              child: FancyText(
                text: 'Top Brands',
                fontfamily: 'Bree',
                size: 20.0,
                color: Colors.deepPurple[900],
              ),
            ),
            Container(
                height: 100.0, child: HorizontalList(listViews: topBrands)),
            Container(
              child: Image.asset('images/10poff.jpg'),
            ),
            //ProductContainer()
          ],
        ),
      ),
    );
  }
  // Widget showBottomSheet(){
  //   return BottomSheet(
  //     builder: ,
  //     onClosing: ,
  //   );
  // }
}
