import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
//import 'package:esell/state/src/theme.dart';

class ReturnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppBar(
            wishlist: true,
            title: Text("Return or Exchange",), 
          )),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(15.0),
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0),),
            Text(
              'Return',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Ropa Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(8.0),),
            Text(
              'We will pick up the product soon.',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Ropa Sans',
                fontSize: 18,
              ),
            ),
            Text(
              'Please enter your account number for refund.',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Ropa Sans',
                fontSize: 18,
              ),
            ),
            Padding(padding: EdgeInsets.all(20.0),),
            FForms(
              type: TextInputType.phone,
              text: "Account Number",
              onChanged: (String x) {
                Navigator.pop(context);
              },
            ),
            Padding(padding: EdgeInsets.all(20.0),),
            Center(
              child: FRaisedButton(
                text: "Submit",
                width: 160.0,
                bg: Theme.of(context).colorScheme.primary,
                color: textColor,
                onPressed: (){
                  showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    actions: <Widget>[
                      FRaisedButton(
                        width:  150.0,
                        text: 'Close',
                        color: textColor,
                        bg: Theme.of(context).colorScheme.primary,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      )
                    ],
                        elevation: 2.0,
                        title: FancyText(
                          text: 'Thank You!',
                          color: textColor,
                          size: 24,
                        ),
                        content: Container(
                          alignment: Alignment.center,
                          height: 100.0,
                          width: 200.0,
                          child: FancyText(
                            text: 'Our operators will contact you soon for return of products',
                            size: 18.0,
                            color: textColor,
                          ),
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
