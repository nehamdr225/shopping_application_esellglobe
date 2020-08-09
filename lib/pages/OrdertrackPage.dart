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
    var width = MediaQuery.of(context).size.width;
    // print(userOrders);
    //Animation<double> animation = listenable;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppBar(
            title: 'Orders & Details',
            drawer: false,
          ),
        ),
        body: ListView(
          children: userOrders != null && userOrders.length > 0
              ? <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'All your Orders',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )
                  ] +
                  userOrders.map<Widget>((eachOrder) {
                    String preview = eachOrder.product.media.front;
                    final time = DateTime.parse(eachOrder.timestamp).toLocal();
                    return Column(
                      children: [
                        SizedBox(
                          width: width,
                          height: 120.0,
                          child: Card(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                side: BorderSide(
                                  color: Colors.grey[200],
                                  width: 1.5,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                    height: 80.0,
                                    width: 80.0,
                                    padding: EdgeInsets.all(2.0),
                                    child: Card(
                                      elevation: 2.0,
                                      child: Image.network(
                                        'https://api.shop2more.com' + preview,
                                        height: 50.0,
                                        width: 50.0,
                                      ),
                                    )),
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: width * 0.50,
                                        child: Text(
                                              "${eachOrder.product.name}",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ) ??
                                            "DATA",
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                      ),
                                      Text(
                                        "${eachOrder.status}  ${time.year}-${time.month}-${time.day}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
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
                          ),
                        ),
                      ],
                    );
                  }).toList()
              : [Center(child: Text("No Orders found!"))],
        ));
  }
}
