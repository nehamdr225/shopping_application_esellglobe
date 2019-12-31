import 'package:esell/pages/OrderLines.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdetrackPage extends StatelessWidget {
  final controller;
  OrdetrackPage({this.controller});

  @override
  Widget build(BuildContext context) {
    final userOrders = Provider.of<UserModel>(context).orders;
    final productModel = Provider.of<ProductModel>(context);
    //Animation<double> animation = listenable;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppBar(
            title: 'Orders & Details',
          ),
        ),
        body: ListView(
          children: userOrders.length > 0
              ? userOrders.map<Widget>((eachOrder) {
                  final time = DateTime.parse(eachOrder['timestamp']).toLocal();
                  final products = eachOrder['products']
                      .map((item) => productModel.one(item['product']))
                      .toList();
                  return Column(
                    children: products.map<Widget>((eachProducts) {
                      return Card(
                        elevation: 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                                height: 80.0,
                                width: 80.0,
                                child: Card(
                                  child: Image.network(
                                    "${eachProducts['media'][0]['src'][0]}",
                                    height: 50.0,
                                    width: 50.0,
                                  ),
                                )),
                            Flexible(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                        "${eachProducts['name']}",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .copyWith(
                                                fontWeight: FontWeight.w700),
                                      ) ??
                                      "DATA",
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                  ),
                                  Text(
                                    "${eachOrder['status']}  ${time.year}-${time.month}-${time.day}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_right,
                                size: 20.0,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OrderLines(
                                          controller: controller,
                                        )));
                              },
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }).toList()
              : [Center(child: Text("No Orders found!"))],
        ));
  }
}
