import 'package:esell/pages/Home.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/Help%20Center/AccQueries.dart';
import 'package:esell/widget/Help%20Center/OfferQueries.dart';
import 'package:esell/widget/Help%20Center/PaymentQueries.dart';
import 'package:esell/widget/Help%20Center/Queries.dart';
import 'package:esell/widget/Help%20Center/ServiceQueries.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AccountCards.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: BlueAppBar(
          elevation: 0.0,
          search: true,
          cart: true,
          onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePageApp()));
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          AccountCards(
            height: 180.0,
            text:
                'Did you know? \n\nYou can easily manage your orders in My orders section',
            buttonText: 'Go to My Orders',
            padding: false,
            onTap: () {},
          ),
          FRaisedButton(
            elevation: 0.0,
            text: 'ANY OTHER ISSUES?',
            color: Colors.grey[400],
            textAlign: TextAlign.start,
            bg: Colors.white,
            onPressed: () {},
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
          FRaisedButton(
            elevation: 0.0,
            text: 'Account Related Queries',
            color: textColor,
            textAlign: TextAlign.start,
            bg: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccQueries()));
            },
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          FRaisedButton(
            elevation: 0.0,
            text: 'Payment Related Queries',
            textAlign: TextAlign.start,
            color: textColor,
            bg: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentQueries()));
            },
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          FRaisedButton(
            elevation: 0.0,
            text: 'Esell Service Queries',
            color: textColor,
            textAlign: TextAlign.start,
            bg: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServiceQueries()));
            },
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          FRaisedButton(
            elevation: 0.0,
            text: 'Offer Related Queries',
            color: textColor,
            textAlign: TextAlign.start,
            bg: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OfferQueries()));
            },
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          FRaisedButton(
            elevation: 0.0,
            text: 'View more',
            textAlign: TextAlign.start,
            color: primaryDark,
            bg: Colors.white,
            onPressed: () {},
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          FRaisedButton(
            elevation: 0.0,
            text: 'Browse Help Topics',
            textAlign: TextAlign.start,
            color: primaryDark,
            bg: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Queries(
                            title: 'Help Topics',
                            widgets: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                FRaisedButton(
                                  elevation: 0.0,
                                  text: "COMMONLY SEARCHED FAQ's",
                                  color: Colors.grey[400],
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {},
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text: "How can I return or exchange an item?",
                                  color: textColor,
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {},
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text:
                                      "What is the replacement process for orders?",
                                  color: textColor,
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {},
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text:
                                      "Which products are not eligible for returns?",
                                  color: textColor,
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {},
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text:
                                      "I have requested for a return of y item, when will it happen?",
                                  color: textColor,
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {},
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                    elevation: 0.5,
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
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text: "SELECT CATEGORY",
                                  color: Colors.grey[400],
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {},
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text: "Shop2more Plus",
                                  color: textColor,
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {},
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text:
                                      "Order",
                                  color: textColor,
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {},
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text:
                                      "Cancellations and Returns",
                                  color: textColor,
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {},
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text:
                                      "Payment",
                                  color: textColor,
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {},
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                    elevation: 0.5,
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
                          )));
            },
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}
