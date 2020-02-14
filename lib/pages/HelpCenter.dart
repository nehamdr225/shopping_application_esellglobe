import 'package:esell/pages/Home.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/Help%20Center/AccQueries.dart';
import 'package:esell/widget/Help%20Center/ContactUs.dart';
import 'package:esell/widget/Help%20Center/ContactUsCard.dart';
import 'package:esell/widget/Help%20Center/OfferQueries.dart';
import 'package:esell/widget/Help%20Center/PaymentQueries.dart';
import 'package:esell/widget/Help%20Center/Queries.dart';
import 'package:esell/widget/Help%20Center/ServiceQueries.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AccountCards.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  var viewmore = false;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
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
          viewmore == false
              ? FRaisedButton(
                  elevation: 0.0,
                  text: 'View more',
                  textAlign: TextAlign.start,
                  color: primaryDark,
                  bg: Colors.white,
                  onPressed: () {
                    setState(() {
                      viewmore = true;
                    });
                  },
                  width: size.width * 0.90,
                  height: 50.0,
                  mainAxisAlignment: MainAxisAlignment.start,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FRaisedButton(
                      elevation: 0.0,
                      text: 'Report an error',
                      color: textColor,
                      textAlign: TextAlign.start,
                      bg: Colors.white,
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
                    FRaisedButton(
                      elevation: 0.0,
                      text: 'Shop2More Plus',
                      color: textColor,
                      textAlign: TextAlign.start,
                      bg: Colors.white,
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
                    FRaisedButton(
                      elevation: 0.0,
                      text: 'Others',
                      color: textColor,
                      textAlign: TextAlign.start,
                      bg: Colors.white,
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
                  ],
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
                            widgets: ListView(
                              //crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ContactUs(
                                                  widgets: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        color: Colors.white,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: FancyText(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                size: 17.0,
                                                                text:
                                                                    'How can I return or exchange an item?',
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: FancyText(
                                                                size: 17.0,
                                                                text:
                                                                    'To return/exchange your order, follow these simple steps: \n- Go to My Orders. \n- Choose the item you wish to return or exchange \n- Fill in te details. \n- Choose Request Return.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(2.0),
                                                      ),
                                                      ContactUsCard(
                                                        padding: false,
                                                        text:
                                                            'Issue still not resolved?',
                                                        buttonText:
                                                            'Contact Us',
                                                        onTap: () {},
                                                      ),
                                                    ],
                                                  ),
                                                )));
                                  },
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
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ContactUs(
                                                  widgets: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        color: Colors.white,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: FancyText(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                size: 17.0,
                                                                text:
                                                                    "What is the replacement process for orders?",
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: FancyText(
                                                                size: 17.0,
                                                                text:
                                                                    "Shop2More's Replacement Policy depends on the product category and the seller. Products are eligible for replacement if they are Damaged Defective or Not as Described.",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: FancyText(
                                                                size: 17.0,
                                                                text:
                                                                    "Here's how you can raise a return request: \n1. Create a 'Return Request'\n-Login and go to My Orders \n-Choose the item you wish to return \n-Fill in the details \n-Choose Request Return",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: FancyText(
                                                                size: 17.0,
                                                                text:
                                                                    "1. Create a 'Return Request'\n-Login and go to My Orders \n-Choose the item you wish to return \n-Fill in the details \n-Choose Request Return \n2. Once the return has been approved, the originally delivered item will be picked up. \n3. Replacement item will be delivered to you at the time of pickup.",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(2.0),
                                                      ),
                                                      ContactUsCard(
                                                        padding: false,
                                                        text:
                                                            'Issue still not resolved?',
                                                        buttonText:
                                                            'Contact Us',
                                                        onTap: () {},
                                                      ),
                                                    ],
                                                  ),
                                                )));
                                  },
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text:
                                      "My order status shows 'Out for Delivery', but I haven't got it yet. When will I get it?",
                                  color: textColor,
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ContactUs(
                                                  widgets: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        color: Colors.white,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: FancyText(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                size: 17.0,
                                                                text:
                                                                    "My order status shows 'Out for Delivery', but I haven't got it yet. When will I get it?",
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: FancyText(
                                                                size: 17.0,
                                                                text:
                                                                    "The courier service will contact you for delivery of your order. Please check your SMS for more details.",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(2.0),
                                                      ),
                                                      ContactUsCard(
                                                        padding: false,
                                                        text:
                                                            'Issue still not resolved?',
                                                        buttonText:
                                                            'Contact Us',
                                                        onTap: () {},
                                                      ),
                                                    ],
                                                  ),
                                                )));
                                  },
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                FRaisedButton(
                                  elevation: 0.0,
                                  text:
                                      "How can I add new delivery address to my Shop2More account?",
                                  color: textColor,
                                  textAlign: TextAlign.start,
                                  bg: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ContactUs(
                                                  widgets: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        color: Colors.white,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: FancyText(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                size: 17.0,
                                                                text:
                                                                    "How can I add new delivery address to my Shop2More account?",
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: FancyText(
                                                                size: 17.0,
                                                                text:
                                                                    "To add a new delivery address, follow these simple steps: \n1. Login to your Shop2More account. \n2. Go to My Account > Settings > Addresses \n3. Add details of your new address \n4. Choose 'Save'.",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(2.0),
                                                      ),
                                                      ContactUsCard(
                                                        padding: false,
                                                        text:
                                                            'Issue still not resolved?',
                                                        buttonText:
                                                            'Contact Us',
                                                        onTap: () {},
                                                      ),
                                                    ],
                                                  ),
                                                )));
                                  },
                                  width: size.width * 0.90,
                                  height: 50.0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                viewmore == false
                                    ? FRaisedButton(
                                        elevation: 0.0,
                                        text: 'View more',
                                        textAlign: TextAlign.start,
                                        color: primaryDark,
                                        bg: Colors.white,
                                        onPressed: () {
                                          setState(() {
                                            viewmore = true;
                                          });
                                        },
                                        width: size.width * 0.90,
                                        height: 50.0,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          FRaisedButton(
                                            elevation: 0.0,
                                            text:
                                                'I have requested for a return for my item. \nWhen will it happen?',
                                            color: textColor,
                                            textAlign: TextAlign.start,
                                            bg: Colors.white,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              ContactUs(
                                                                widgets: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Container(
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: <
                                                                            Widget>[
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                FancyText(
                                                                              fontWeight: FontWeight.w500,
                                                                              size: 17.0,
                                                                              text: "I have requested for a return for my item. \nWhen will it happen?",
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                FancyText(
                                                                              size: 17.0,
                                                                              text: "You can now track the status of your return easily right from your Shop2More accunt or mobile app. Just visit the 'My Orders' page to see its status along with the date of pick up and status of your refund if applicable. \nYou will also receive an email & SMS with the details of your return.",
                                                                              textAlign: TextAlign.left,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              2.0),
                                                                    ),
                                                                    ContactUsCard(
                                                                      padding:
                                                                          false,
                                                                      text:
                                                                          'Issue still not resolved?',
                                                                      buttonText:
                                                                          'Contact Us',
                                                                      onTap:
                                                                          () {},
                                                                    ),
                                                                  ],
                                                                ),
                                                              )));
                                            },
                                            width: size.width * 0.90,
                                            height: 50.0,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                          ),
                                          FRaisedButton(
                                            elevation: 0.0,
                                            text:
                                                "How long does it take to cancel an order?",
                                            color: textColor,
                                            textAlign: TextAlign.start,
                                            bg: Colors.white,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ContactUs(
                                                            widgets: Column(
                                                              children: <
                                                                  Widget>[
                                                                    Container(
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: <
                                                                            Widget>[
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                FancyText(
                                                                              fontWeight: FontWeight.w500,
                                                                              size: 17.0,
                                                                              text: "I have requested for a return for my item. \nWhen will it happen?",
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                FancyText(
                                                                              size: 17.0,
                                                                              text: "You can now track the status of your return easily right from your Shop2More accunt or mobile app. Just visit the 'My Orders' page to see its status along with the date of pick up and status of your refund if applicable. \nYou will also receive an email & SMS with the details of your return.",
                                                                              textAlign: TextAlign.left,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              2.0),
                                                                    ),
                                                                ContactUsCard(
                                                                  padding:
                                                                      false,
                                                                  text:
                                                                      'Issue still not resolved?',
                                                                  buttonText:
                                                                      'Contact Us',
                                                                  onTap: () {},
                                                                ),
                                                              ],
                                                            ),
                                                          )));
                                            },
                                            width: size.width * 0.90,
                                            height: 50.0,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                          ),
                                          FRaisedButton(
                                            elevation: 0.0,
                                            text:
                                                'How can I use a new email address to log in to my Shop2More account',
                                            color: textColor,
                                            textAlign: TextAlign.start,
                                            bg: Colors.white,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ContactUs(
                                                            widgets: Column(
                                                              children: <
                                                                  Widget>[
                                                                    Container(
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: <
                                                                            Widget>[
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                FancyText(
                                                                              fontWeight: FontWeight.w500,
                                                                              size: 17.0,
                                                                              text: "I have requested for a return for my item. \nWhen will it happen?",
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                FancyText(
                                                                              size: 17.0,
                                                                              text: "You can now track the status of your return easily right from your Shop2More accunt or mobile app. Just visit the 'My Orders' page to see its status along with the date of pick up and status of your refund if applicable. \nYou will also receive an email & SMS with the details of your return.",
                                                                              textAlign: TextAlign.left,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              2.0),
                                                                    ),
                                                                ContactUsCard(
                                                                  padding:
                                                                      false,
                                                                  text:
                                                                      'Issue still not resolved?',
                                                                  buttonText:
                                                                      'Contact Us',
                                                                  onTap: () {},
                                                                ),
                                                              ],
                                                            ),
                                                          )));
                                            },
                                            width: size.width * 0.90,
                                            height: 50.0,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                          ),
                                        ],
                                      ),
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
                                  text: "Order",
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
                                  text: "Cancellations and Returns",
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
                                  text: "Payment",
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
                                    height: 50.0,
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
