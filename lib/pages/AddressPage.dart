import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      persistentFooterButtons: <Widget>[
        SizedBox(
          width: width-150.0,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width - 50.0,
              child: Column(
                children: <Widget>[
                  FForms(
                    underline: true,
                    text: 'Full Name',
                    type: TextInputType.text,
                  ),
                  FForms(
                    underline: true,
                    text: 'Mobile number',
                    type: TextInputType.phone,
                  ),
                  FForms(
                    underline: true,
                    text: 'City',
                    type: TextInputType.text,
                  ),
                  FForms(
                    underline: true,
                    text: 'Address',
                    type: TextInputType.text,
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
                  SizedBox(height: 20.0,),
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
