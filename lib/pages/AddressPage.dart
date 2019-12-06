import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(
        Theme.of(context).colorScheme.primaryVariant);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      persistentFooterButtons: <Widget>[
        SizedBox(
          width: width - 150.0,
          child: RaisedButton(
            color: primary,
            child: Text('Save', style: Theme.of(context).textTheme.title),
            onPressed: () {},
          ),
        )
      ],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            title: 'Add Shipping Address',
          )),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width - 50.0,
              child: Column(
                children: <Widget>[
                  Padding( // full name
                    padding: const EdgeInsets.all(8.0),
                    child: FForms(
                      text: 'Full Name',
                      type: TextInputType.text,
                    ),
                  ),
                  Padding( //phone number
                    padding: const EdgeInsets.all(8.0),
                    child: FForms(
                      text: 'Mobile number',
                      type: TextInputType.phone,
                    ),
                  ),
                  Table( //house no. and city
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FForms(
                            text: 'House no.',
                            type: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FForms(
                            text: 'City',
                            type: TextInputType.text,
                          ),
                        ),
                      ])
                    ],
                  ),
                  Padding( //country
                    padding: const EdgeInsets.all(8.0),
                    child: FForms(
                      text: 'Country',
                      type: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width - 50.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Select a label for effective delivery'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Card(
                        child: Container(
                          color: Colors.grey[200],
                          alignment: Alignment.center,
                          height: 70.0,
                          width: 110.0,
                          child: InkWell(
                            child: Text('OFFICE'),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey[200],
                          ),
                          alignment: Alignment.center,
                          height: 70.0,
                          width: 110.0,
                          child: InkWell(
                            child: Text('HOME'),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
