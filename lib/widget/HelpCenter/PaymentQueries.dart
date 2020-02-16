import 'package:esell/state/state.dart';
import 'package:esell/widget/Help%20Center/ContactUs.dart';
import 'package:esell/widget/Help%20Center/ContactUsCard.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/SliverApBar.dart';
import 'package:flutter/material.dart';

class PaymentQueries extends StatefulWidget {
  final description;
  PaymentQueries(
      {this.description:
          "Once your order has been logged and payment authorization has been received, the seller confirms receipt of the order and begins processing it. \nYou will receive an email containing the details of your order when the seller receives it and confirms the same."});
  @override
  _PaymentQueriesState createState() => _PaymentQueriesState();
}

class _PaymentQueriesState extends State<PaymentQueries>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  var viewmore = false;
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
              padding: const EdgeInsets.only(top: 0.0),
              child: FRaisedButton(
                elevation: 0.0,
                text: 'I made a payment but order was not successful',
                color: textColor,
                textAlign: TextAlign.start,
                bg: Colors.white,
                width: size.width * 0.90,
                height: 60.0,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                mainAxisAlignment: MainAxisAlignment.start,
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
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: FancyText(
                                              fontWeight: FontWeight.w500,
                                              size: 17.0,
                                              text:
                                                  "How do I know my order has been confirmed?",
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: FancyText(
                                              size: 17.0,
                                              text: widget.description,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                    ),
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
              ),
            ),
            FRaisedButton(
                elevation: 0.0,
                text: "I am unable to avail the displayed offer",
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
                height: 60.0,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                mainAxisAlignment: MainAxisAlignment.start),
            // FRaisedButton(
            //   elevation: 0.0,
            //   text: "I have queries related to EMI",
            //   color: textColor,
            //   textAlign: TextAlign.start,
            //   bg: Colors.white,
            //   onPressed: () {},
            //   width: size.width * 0.90,
            //   height: 60.0,
            //   fontSize: 17.0,
            //   fontWeight: FontWeight.w500,
            //   mainAxisAlignment: MainAxisAlignment.start,
            // ),
            FRaisedButton(
              elevation: 0.0,
              text: "I'm not able to use my PhonePay wallet to pay",
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
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FancyText(
                                            fontWeight: FontWeight.w500,
                                            size: 17.0,
                                            text:
                                                'Do I need to install the PhonePe app to use the waller option on my Shop2more account?',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FancyText(
                                            size: 17.0,
                                            text:
                                                'No, you will be able to use the wallet option on your Shop2more account for payments without installing the PhonePe app. you can choose to install the PhonePe app to access other payment features.',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2.0),
                                  ),
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
              height: 60.0,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            viewmore == false
                ? FRaisedButton(
                    elevation: 0.0,
                    text: "View more",
                    color: primaryDark,
                    textAlign: TextAlign.start,
                    bg: Colors.white,
                    onPressed: () {
                      setState(() {
                        viewmore = true;
                      });
                    },
                    width: size.width * 0.90,
                    height: 60.0,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    mainAxisAlignment: MainAxisAlignment.start)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FRaisedButton(
                        elevation: 0.0,
                        text: "I haven't received the Gift Card I bought.",
                        color: textColor,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
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
                        text: 'I am not able to use my Gift Card',
                        color: textColor,
                        textAlign: TextAlign.start,
                        bg: Colors.white,
                        fontWeight: FontWeight.w500,
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
                        fontWeight: FontWeight.w500,
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
          ],
        ),
      ),
    );
  }
}
