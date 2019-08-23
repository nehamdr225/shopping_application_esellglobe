import 'package:flutter/material.dart';
import 'package:EsellGlobe/pages/Products.dart';
import 'package:EsellGlobe/widget/Product.dart';
import 'package:EsellGlobe/widget/atoms/centerText.dart';

class ProductContainer extends StatelessWidget {
  final products;
  ProductContainer({this.products});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
        Padding(
            padding: EdgeInsets.all(12.0),
            child: Table(children: [
              TableRow(children: [
                Text(
                  'Products',
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
          height: 212.0,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return products.length > 0
                  ? Product(
                      name: products[index]['name'],
                      image: products[index]['media'][0]['src'].length > 0
                          ? products[index]['media'][0]['src'][0]
                          : null,
                      price: products[index]['price'],
                      seller: products[index]['seller'],
                      oldPrice: products[index]['oldPrice'] != null
                          ? products[index]['oldPrice']
                          : products[index]['price'],
                      details: products[index]['details'])
                  : CenterText(
                      text: 'Products are being loaded...',
                      size: 12.0,
                      indicator: true,
                    );
            },
          ),
        ),
      ]),
    );
  }
}
