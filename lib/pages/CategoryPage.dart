import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/CardView.dart';
//import 'package:esell/widget/molecules/GridList.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String text;
  CategoryPage({this.text}); 
  final List category= [
    'Top Wear',
    'Bottom Wear',
    'Foot Wear',
    'Backpacks',
    'Watches and Glasses'
  ];

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final cat = text == 'Top Wear'
        ? SubMain['top']
        : text == 'Bottom Wear'
            ? SubMain['bottom']
            : text == "Foot Wear" ? SubMain['shoes'] : SubMain['glasses'];

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: FAppBar(wishlist: true, cart: true),
            ),
            body: ListView(
              children: <Widget>[
                InfoNavBar(
                  text: 'Top Wear',
                ),
                Container(
                  child: CardView(cat: cat),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                ),
              
              ],
            )));
  }
}
