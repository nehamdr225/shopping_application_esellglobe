// import 'package:esell/state/state.dart';
import 'package:esell/state/state.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  Services(
      {this.payOnDelivery: true,
      this.replacement: true,
      this.amazonDelivery: true,
      this.aYearWarranty: true,
      this.contact});
  final bool payOnDelivery, replacement, amazonDelivery, aYearWarranty;
  final contact;

  @override
  Widget build(BuildContext context) {
    final body1 = Theme.of(context).textTheme.body1.copyWith(color: primaryDark);
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 8.0),
        height: 70.0,
        alignment: Alignment.center,
        color: Colors.white,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              payOnDelivery
                  ? Column(children: [
                      Icon(Icons.payment,
                      color: primary,),
                      Text(
                        'Pay on \nDelivery',
                        style: body1,
                      )
                    ])
                  : Text(''),
              replacement
                  ? Column(children: [
                      Icon(Icons.change_history,color: primary,),
                      Text(
                        '10 Days\n Replacement',
                        textAlign: TextAlign.center,
                        style: body1,
                      )
                    ])
                  : Text(''),
            
              aYearWarranty
                  ? Column(children: [
                      Icon(Icons.check_circle_outline,color: primary,),
                      Text(
                        'One Year Warranty',
                        style: body1,
                      )
                    ])
                  : Text(''),
            ]),
      ),
    );
  }
}
