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

class HomePageApp extends StatelessWidget {
  const HomePageApp({Key key, this.searchController});
  final searchController;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(primary);
    var user = Provider.of<UserModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            //centerTitle: true,
            title: Text('esellglobe',
                style: TextStyle(fontFamily: 'Bree', color: textColor)),
            flexibleSpace: Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, right: 25.0, left: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white, border: Border.all(width: 1.0, color: Colors.black26)),
                height: 40.0,
                
                child: TextField(
                  autofocus: true,
                  onChanged: (value) {
                    searchController(value);
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: textColor),
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 11.0),
                      hintText: "Search for Fashion",
                      hintStyle: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 12,
                          color: Colors.black54),
                      // labelStyle: ,
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
            ),
            iconTheme: IconThemeData(
              color: icontheme3,
            ),
            backgroundColor: primary,
            actions: <Widget>[
              // FIcons(
              //   icon: Icons.search,
              //   alignment: Alignment.centerRight,
              //   color: icontheme3,
              //   onPressed: () {},
              // ),
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
              padding: EdgeInsets.all(10.0),
            ),
            Container(height: 420, child: FCarousel()),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 2.0),
              child: FancyText(
                text: "Men's Fashion",
                fontfamily: 'Bree',
                size: 20.0,
                color: textColor,
              ),
            ),
            Container(
              child: GridList(listViews: MEN),
            ),
            Padding(
               padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 2.0),
              child: FancyText(
                text: "Women's Fashion",
                fontfamily: 'Bree',
                size: 20.0,
                color: textColor,
              ),
            ),
            Container(
              child: GridList(listViews: WOMEN),
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
