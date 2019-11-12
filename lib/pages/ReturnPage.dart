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
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            title: "Return or Exchange",
          )),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Text(
            'Return or Exchange',
            style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Ropa Sans',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Return',
            style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Ropa Sans',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
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
          FForms(
            type: TextInputType.number,
            text: "Account Number",
            onChanged: () {},
          ),
          FRaisedButton(
            text: "Submit",
            width: 160.0,
            bg: Colors.deepPurple[900],
            color: Colors.white,
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
