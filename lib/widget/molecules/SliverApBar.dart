import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';

class SliverApBar extends StatelessWidget {
  final bool innerBoxIsScrolled;
  final String title;
  SliverApBar({this.innerBoxIsScrolled, this.title});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            }),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Padding(
          padding: EdgeInsets.all(7.0),
          child: FForms(
            borderColor: Colors.white,
            height: 45.0,
            width: size.width * 0.90,
            text: 'Search for topics or questions',
            borderRadius: 30.0,
            labeltext: false,
            icon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
