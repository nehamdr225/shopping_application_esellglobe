import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/CategoryPage.dart';
import 'package:esell/pages/Wishlist.dart';
import 'package:esell/state/src/consts.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/molecules/HorizontalList.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/widget/molecules/genderGrid.dart';
import 'package:flutter/material.dart';

class GenderSpecific extends StatefulWidget {
  final gender;
  GenderSpecific({this.gender});

  @override
  _GenderSpecificState createState() => _GenderSpecificState();
}

class _GenderSpecificState extends State<GenderSpecific>
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0.5,
                title: Text(widget.gender,
                    style: TextStyle(
                      color: primaryDark,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                iconTheme: IconThemeData(
                  color: primaryDark,
                ),
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                actions: <Widget>[
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WishlistPage()));
                      })
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(98.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 8.0),
                    child: Container(
                        alignment: Alignment.center,
                        height: 80.0,
                        child: GenderSpecHorizontalList(
                          border: true,
                          listViews: widget.gender == 'Male' ? MEN : WOMEN,
                        )),
                  ),
                ),
              )
            ];
          },
          body: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: MEN.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    InfoNavBar(
                      text: MEN[index]['name'],
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CategoryPage(
                              text: MEN[index]['name'],
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 240.0,
                      child: GenderGrids(
                        gender: widget.gender,
                        crossAxisCount: 3,
                        cat: widget.gender == 'Male'
                            ? MEN[index]['name']
                            : WOMEN[index]['name'],
                      ),
                    ),
                  ],
                );
              }),
        ));
  }
}
