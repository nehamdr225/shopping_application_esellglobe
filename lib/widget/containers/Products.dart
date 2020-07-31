// import 'package:flutter/material.dart';
// import 'package:esell/pages/Products.dart';
// import 'package:esell/widget/molecules/Product.dart';
// import 'package:esell/widget/atoms/centerText.dart';
// import 'package:provider/provider.dart';
// import 'package:esell/state/state.dart';

// class ProductContaine extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final product = Provider.of<ProductModel>(context);
//     return SliverList(
//         delegate: SliverChildListDelegate(<Widget>[
//       Padding(
//           padding: EdgeInsets.all(12.0),
//           child: Table(children: [
//             TableRow(children: [
//               Text(
//                 'Products',
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//               TableRowInkWell(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => ProductsPage()));
//                   },
//                   child: Align(
//                     alignment: Alignment.topRight,
//                     child: Text(
//                       'view all',
//                       style: Theme.of(context)
//                           .textTheme
//                           .caption
//                           .copyWith(decoration: TextDecoration.underline),
//                     ),
//                   ))
//             ])
//           ])),
//       Container(
//         height: 212.0,
//         child: ListView.builder(
//           itemCount: 5,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext context, int index) {
//             final products = product.products;
//             return products.length > 0
//                 ? Product(
//                     imgheight: 130.0,
//                     category: products[index].category,
//                     id: products[index].id)
//                 : CenterText(
//                     text: 'Products are being loaded...',
//                     size: 12.0,
//                     indicator: true,
//                   );
//           },
//         ),
//       ),
//     ]));
//   }
// }
