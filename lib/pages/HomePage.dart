import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import '../widget/Carousel.dart';
import '../widget/colors.dart';
import '../widget/Icons.dart';
import '../Drawer.dart';
import '../widget/horizontalLIST.dart';
import '../widget/productsPage.dart';
import './Gridview.dart';

class EsellglobeApp extends StatelessWidget {
  // final double barHeight = 66.0;
  //const FlexibleAppBar();
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        drawer: DrawerApp(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.grey[200],
              floating: true,
              flexibleSpace: FCarousel(),
              expandedHeight: 200.0,
              actions: <Widget>[
                FIcons(icon:Icons.search, color: icontheme),
                FIcons(icon:Icons.shopping_cart, color: icontheme)
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Categories',
                        style: Theme.of(context).textTheme.title),
                  ),
                  HorizontalList(),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Table(children: [
                      TableRow(children: [
                        Text(
                          'Special Offers ',
                          style: Theme.of(context).textTheme.title,
                        ),
                        TableRowInkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AllProductsPage()));
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'view all',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ))
                        // style: TextStyle( fontFamily: 'Victorian',
                        //       fontSize: 28.0 ,color: Colors.black45), )
                      ])
                    ])),
                Products(),
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Table(children: [
                      TableRow(children: [
                        Text(
                          'Top Wears',
                          style: Theme.of(context).textTheme.title,
                        ),
                        TableRowInkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AllProductsPage()));
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'view all',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ))
                      ])
                    ])),
                Products(),
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Table(children: [
                      TableRow(children: [
                        Text(
                          'Bottom Wears ',
                          style: Theme.of(context).textTheme.title,
                        ),
                        TableRowInkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AllProductsPage()));
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'view all',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        decoration: TextDecoration.underline),
                              ),
                            ))
                      ])
                    ])),
                Products(),
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Table(children: [
                      TableRow(children: [
                        Text(
                          'Foot Wears ',
                          style: Theme.of(context).textTheme.title,
                        ),
                        TableRowInkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AllProductsPage()));
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'view all',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ))
                      ])
                    ])),
                Products(),
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Table(children: [
                      TableRow(children: [
                        Text(
                          'Watches & Glasses ',
                          style: Theme.of(context).textTheme.title,
                        ),
                        TableRowInkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AllProductsPage()));
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'view all',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ))
                      ])
                    ])),
                Products(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
