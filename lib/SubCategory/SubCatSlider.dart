import 'package:flutter/material.dart';
import 'package:EsellGlobe/pages/pages.dart';
import 'package:EsellGlobe/SubCategory/SubCatProducts.dart';

class SubCatSlider extends StatelessWidget {
  final String text;
  final products;
  SubCatSlider({this.products, this.text});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
        Padding(
            padding: EdgeInsets.all(12.0),
            child: Table(children: [
              TableRow(children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.title,
                ),
                TableRowInkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ProductsPage(products: products)));
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'view all',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ))
              ])
            ])),
        Container(
          height: 90.0,
          width: 150.0,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return SubCatProducts(
                text: products[index]['name'],
                 image: products[index]['media'][0]['src'].length > 0
                    ? products[index]['media'][0]['src'][0]
                    : null,
              );
            },
          ),
        ),
      ]),
    );
  }
}
