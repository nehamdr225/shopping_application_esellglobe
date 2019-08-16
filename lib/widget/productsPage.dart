import 'package:flutter/material.dart';
import '../pages/Gridview.dart';
import './products.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  Products({this.products});

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
                          builder: (context) => AllProductsPage()));
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
          height: 150.0,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Product(
                name: products[index]['name'],
                image: products[index]['picture'],
                price: products[index]['price'],
                seller: products[index]['seller'],
                oldPrice: products[index]['oldPrice'],
              );
            },
          ),
        ),
      ]),
    );
  }
}
