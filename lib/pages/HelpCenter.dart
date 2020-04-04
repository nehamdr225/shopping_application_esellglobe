import 'package:esell/pages/Home.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/HelpCenter/AccQueries.dart';
import 'package:esell/widget/HelpCenter/BrowseMore.dart';
import 'package:esell/widget/HelpCenter/ContactUs.dart';
import 'package:esell/widget/HelpCenter/ContactUsCard.dart';
import 'package:esell/widget/HelpCenter/OfferQueries.dart';
import 'package:esell/widget/HelpCenter/PaymentQueries.dart';
import 'package:esell/widget/HelpCenter/ServiceQueries.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  var viewmore = false;
  var browsemore = false;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: BlueAppBar(
          title: 'Help Center',
          elevation: 0.0,
          search: true,
          cart: true,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageApp()));
          },
        ),
      ),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 8.0),
          child: FancyText(
            text: "Top FAQ's",
            size: 16.0,
            color: Colors.grey[600],
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: FRaisedButton(
            elevation: 0.0,
            text: 'ANY OTHER ISSUES?',
            color: Colors.grey[400],
            textAlign: TextAlign.start,
            bg: Colors.white,
            onPressed: () {},
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: FRaisedButton(
            elevation: 0.0,
            text: 'Account Related Queries',
            color: textColor,
            textAlign: TextAlign.start,
            bg: Colors.white,
            fontSize: 15.0,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AccQueries()));
            },
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: FRaisedButton(
            elevation: 0.0,
            text: 'Payment Related Queries',
            textAlign: TextAlign.start,
            color: textColor,
            bg: Colors.white,
            fontSize: 15.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentQueries()));
            },
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: FRaisedButton(
            elevation: 0.0,
            text: 'Shop2More Service Queries',
            color: textColor,
            textAlign: TextAlign.start,
            bg: Colors.white,
            fontSize: 15.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServiceQueries()));
            },
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: FRaisedButton(
            elevation: 0.0,
            text: 'Offer Related Queries',
            color: textColor,
            textAlign: TextAlign.start,
            bg: Colors.white,
            fontSize: 15.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OfferQueries()));
            },
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
        viewmore == false
              ? Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child:FRaisedButton(
                  elevation: 0.0,
                  text: 'View more',
                  textAlign: TextAlign.start,
                  color: primaryDark,
                  bg: Colors.white,
                  fontSize: 15.0,
                  onPressed: () {
                    setState(() {
                      viewmore = true;
                    });
                  },
                  width: size.width * 0.90,
                  height: 50.0,
                  mainAxisAlignment: MainAxisAlignment.start,
                )
              )
              
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: FRaisedButton(
                        elevation: 0.0,
                        text: 'Report an error',
                        color: textColor,
                        textAlign: TextAlign.start,
                        bg: Colors.white,
                        fontSize: 15.0,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactUs(
                                        widgets: Column(
                                          children: <Widget>[
                                            ContactUsCard(
                                              padding: false,
                                              text: 'Issue still not resolved?',
                                              buttonText: 'Contact Us',
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      )));
                        },
                        width: size.width * 0.90,
                        height: 50.0,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: FRaisedButton(
                        elevation: 0.0,
                        text: 'Others',
                        color: textColor,
                        textAlign: TextAlign.start,
                        bg: Colors.white,
                        fontSize: 15.0,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactUs(
                                        widgets: Column(
                                          children: <Widget>[
                                            ContactUsCard(
                                              padding: false,
                                              text: 'Issue still not resolved?',
                                              buttonText: 'Contact Us',
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      )));
                        },
                        width: size.width * 0.90,
                        height: 50.0,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                  ],
                ),
        
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: FRaisedButton(
            elevation: 0.0,
            text: 'Browse Help Topics',
            textAlign: TextAlign.start,
            color: primaryDark,
            bg: Colors.white,
            fontSize: 15.0,
            width: size.width * 0.90,
            height: 50.0,
            mainAxisAlignment: MainAxisAlignment.start,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BrowseMore()));
            },
          ),
        ),
      ]),
    );
  }
}
