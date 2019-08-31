import 'package:esell/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/colors.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class FAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black87);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: icontheme2),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(
            //     Icons.search,
            //   ),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
