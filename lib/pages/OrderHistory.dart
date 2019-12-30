import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:esell/state/state.dart';

class OrderHistory extends StatelessWidget {
  final products;
  OrderHistory({this.products});
  @override
  Widget build(BuildContext context) {
     //final productModel = Provider.of<ProductModel>(context);
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: products.map<Widget>((eachProducts) {
        return SizedBox(
          height: 80.0,
          width: width * 0.90,
          child: Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Padding (
                  padding: EdgeInsets.all(8.0),
                  child: Text("${eachProducts['name']}") ?? "DATA",),
              ),
              Image.network(
                "${eachProducts['media'][0]['src'][0]}",
                height: 100.0,
                width: 100.0,
              ),
            ],
          )),
        );
      }).toList(),
    );
  }
}

// body: ListView(
//         children: [
//           TabView(
//             tabs: ['History', 'Pending'],
//             tabItems: <Widget>[
//               Column(
//                 children: userOrders.length > 0
//                     ? userOrders.map<Widget>((eachOrder) {
//                         final time =
//                             DateTime.parse(eachOrder['timestamp']).toLocal();
//                         return Card(
//                             elevation: 0.0,
//                             child: DrawerEPanel([
//                               ListItem(
//                                 title: Text(
//                                   "${time.year} - ${time.month} - ${time.day}",
//                                 ),
//                                 subtitle: "${eachOrder['status']}",
//                                 bodyBuilder: (context) {
//                                   final products = eachOrder['products']
//                                       .map((item) =>
//                                           productModel.one(item['product']))
//                                       .toList();
//                                   return OrderHistory(
//                                     products: products,
//                                   );
//                                 },
//                               ),
//                             ]));
//                       }).toList()
//                     : [Text("No Orders found!")],
//               ),
//               AnimatedBuilder(
//                 animation: controller,
//                 builder: (BuildContext context, Widget child) => Column(
//                   children: [
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Row(
//                       //ONE
//                       children: <Widget>[
//                         CustomPaint(
//                           size: Size(_width, _height),
//                           painter: MakeLine(
//                               color: ordered == true
//                                   ? dotColor.value
//                                   : Colors.grey[300]),
//                         ),
//                         SizedBox(width: 20.0),
//                         DataContainer(
//                           data: 'Ordered and Approved',
//                           style: ordered == true ? textStyle.value : begin,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       //TWO
//                       children: <Widget>[
//                         CustomPaint(
//                           size: Size(_width, _height),
//                           painter: MakeLine(
//                               color: packed == true
//                                   ? dotColor.value
//                                   : Colors.grey[300]),
//                         ),
//                         SizedBox(width: 20.0),
//                         DataContainer(
//                           data: 'Packed',
//                           style: packed == true ? textStyle.value : begin,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       //THREE
//                       children: <Widget>[
//                         CustomPaint(
//                           size: Size(_width, _height),
//                           painter: MakeLine(
//                               color: shipped == true
//                                   ? dotColor.value
//                                   : Colors.grey[300]),
//                           //child: Container(),
//                         ),
//                         SizedBox(width: 20.0),
//                         DataContainer(
//                           data: 'Shipped',
//                           style: shipped == true ? textStyle.value : begin,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       //FOUR
//                       children: <Widget>[
//                         CustomPaint(
//                           size: Size(_width, _height),
//                           painter: MakeLine(
//                               color: delivered == true
//                                   ? dotColor.value
//                                   : Colors.grey[300]),
//                           //child: Container(),
//                         ),
//                         SizedBox(width: 20.0),
//                         DataContainer(
//                           data: 'Delivered',
//                           style: delivered == true ? textStyle.value : begin,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),



// body: ListView(
//     children: userOrders.length > 0
//     ? userOrders.map<Widget>((eachOrder) {
//         final time = DateTime.parse(eachOrder['timestamp']).toLocal();
//         final products = eachOrder['products']
//           .map((item) => productModel.one(item['product']))
//          .toList();
//       return Card(
//         elevation: 0.0,
//         child: products.map<Widget>((eachProducts) {
//           return Row(
//             children: <Widget>[
//               Image.network(
//                 "${eachProducts['media'][0]['src'][0]}",
//                 height: 100.0,
//                 width: 100.0,
//               ),
//               Column(
//                 children: <Widget>[
//                   Text(
//                         "${eachProducts['name']}",
//                         style: Theme.of(context)
//                             .textTheme
//                             .body1
//                             .copyWith(
//                                 fontWeight: FontWeight.w400),
//                       ) ??
//                       "DATA",
//                   Text(
//                     "${eachOrder['status']}  ${time.year}-${time.month}-${time.day}",
//                   ),
//                 ],
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.arrow_right,
//                   size: 18.0,
//         ),
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//               builder: (context) => AnimatedBuilder(
//                 animation: controller,
//                 builder: (BuildContext context, Widget child) => Column(
//                   children: [
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Row(
//                       //ONE
//                       children: <Widget>[
//                         CustomPaint(
//                           size: Size(
//                               _width, _height),
//                           painter: MakeLine(
//                               color: ordered ==
//                                       true
//                                   ? dotColor.value
//                                   : Colors
//                                       .grey[300]),
//                         ),
//                         SizedBox(width: 20.0),
//                         DataContainer(
//                           data:
//                               'Ordered and Approved',
//                           style: ordered == true
//                               ? textStyle.value
//                               : begin,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       //TWO
//                       children: <Widget>[
//                         CustomPaint(
//                           size: Size(
//                               _width, _height),
//                           painter: MakeLine(
//                               color: packed ==
//                                       true
//                                   ? dotColor.value
//                                   : Colors
//                                       .grey[300]),
//                         ),
//                         SizedBox(width: 20.0),
//                         DataContainer(
//                           data: 'Packed',
//                           style: packed == true
//                               ? textStyle.value
//                               : begin,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       //THREE
//                       children: <Widget>[
//                         CustomPaint(
//                           size: Size(
//                               _width, _height),
//                           painter: MakeLine(
//                               color: shipped ==
//                                       true
//                                   ? dotColor.value
//                                   : Colors
//                                       .grey[300]),
//                           //child: Container(),
//                         ),
//                         SizedBox(width: 20.0),
//                         DataContainer(
//                           data: 'Shipped',
//                           style: shipped == true
//                               ? textStyle.value
//                               : begin,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       //FOUR
//                       children: <Widget>[
//                         CustomPaint(
//                           size: Size(
//                               _width, _height),
//                           painter: MakeLine(
//                               color: delivered ==
//                                       true
//                                   ? dotColor.value
//                                   : Colors
//                                       .grey[300]),
//                           //child: Container(),
//                         ),
//                         SizedBox(width: 20.0),
//                         DataContainer(
//                           data: 'Delivered',
//                           style: delivered == true
//                               ? textStyle.value
//                               : begin,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )));
//                 },
//               )
//             ],
//           );
//         }));
//           }).toList()
//         : [Center(child: Text("No Orders found!"))],
//         )