import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/SliverApBar.dart';
import 'package:flutter/material.dart';

class PaymentQueries extends StatefulWidget {
  @override
  _PaymentQueriesState createState() => _PaymentQueriesState();
}

class _PaymentQueriesState extends State<PaymentQueries>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverApBar(
              innerBoxIsScrolled: innerBoxIsScrolled,
              title: 'Payment Queries',
              
            )
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: FRaisedButton(
                  elevation: 0.0,
                  text: 'I made a payment but order was not successful',
                  color: textColor,
                  textAlign: TextAlign.start,
                  bg: Colors.white,
                  onPressed: () {},
                  width: size.width * 0.90,
                  height: 60.0,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                  mainAxisAlignment: MainAxisAlignment.start),
            ),
            FRaisedButton(
                elevation: 0.0,
                text: "I am unable to avail the displayed offer",
                color: textColor,
                textAlign: TextAlign.start,
                bg: Colors.white,
                onPressed: () {},
                width: size.width * 0.90,
                height: 60.0,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                mainAxisAlignment: MainAxisAlignment.start),
            FRaisedButton(
              elevation: 0.0,
              text: "I have queries related to EMI",
              color: textColor,
              textAlign: TextAlign.start,
              bg: Colors.white,
              onPressed: () {},
              width: size.width * 0.90,
              height: 60.0,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            FRaisedButton(
              elevation: 0.0,
              text: "I'm not able to use my PhonePay wallet to pay",
              color: textColor,
              textAlign: TextAlign.start,
              bg: Colors.white,
              onPressed: () {},
              width: size.width * 0.90,
              height: 60.0,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            FRaisedButton(
                elevation: 0.0,
                text: "View more",
                color: primaryDark,
                textAlign: TextAlign.start,
                bg: Colors.white,
                onPressed: () {},
                width: size.width * 0.90,
                height: 60.0,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                mainAxisAlignment: MainAxisAlignment.start),
          ],
        ),
      ),
    );
  }
}
