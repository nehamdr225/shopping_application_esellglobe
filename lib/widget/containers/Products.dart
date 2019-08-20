import 'package:flutter/material.dart';
import '../../pages/Products.dart';
import '../Product.dart';

class ProductContainer extends StatelessWidget {
  final  products;
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
          height: 202.0,
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
                  details: products[index]['details']);
            },
          ),
        ),
      ]),
    );
  }
}
