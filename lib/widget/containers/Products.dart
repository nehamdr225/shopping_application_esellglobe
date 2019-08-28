import 'package:flutter/material.dart';
import 'package:esell/pages/pages.dart';
import 'package:esell/widget/molecules/Product.dart';
import 'package:esell/widget/atoms/centerText.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class ProductContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
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
                            ProductsPage(products: product.products)));
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
            final products = product.products;
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
                    details: products[index]['details'],
                    id: products[index]['_id'])
                : CenterText(
                    text: 'Products are being loaded...',
                    size: 12.0,
                    indicator: true,
                  );
          },
        ),
      ),
    ]));
  }
}
