import 'package:esell/state/state.dart';
import 'package:esell/widget/Help%20Center/ContactUs.dart';
import 'package:esell/widget/Help%20Center/ContactUsCard.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/SliverApBar.dart';
import 'package:flutter/material.dart';

class OfferQueries extends StatefulWidget {
  @override
  _OfferQueriesState createState() => _OfferQueriesState();
}

class _OfferQueriesState extends State<OfferQueries>
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
            FRaisedButton(
                elevation: 0.0,
                text: "How do I check if a cashback is applied to my order?",
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
                                                "How do I check if cash back is applied to my order?",
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FancyText(
                                            size: 17.0,
                                            text:
                                                "Please refer the following in the terms and conditions of the offer to check if it is applicable on your order:\n- Date of Purchase\n- Total order value\n- Mode of payment \n- Products that are part of the offer \n- Maximum cashback per transaction/card",
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
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
                mainAxisAlignment: MainAxisAlignment.start),
            FRaisedButton(
              elevation: 0.0,
              text: "How do I check if an instant discount is applied to my order?",
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
                                                "How do I check if an instant discount is applied to my order?",
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FancyText(
                                            size: 17.0,
                                            text:
                                                "Please refer the following in the terms and conditions of the offer to check if it is applicable on your order:\n- Date of Purchase\n- Total order value\n- Mode of payment \n- Products that are part of the offer \n- Maximum cashback per transaction/card",
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
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
            FRaisedButton(
              elevation: 0.0,
              text: "How do I check if I've received the Gift Card as part of an offer?",
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
                                                "How do I check if I've received the Gift Card as part of an offer?",
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FancyText(
                                            size: 17.0,
                                            text:
                                                "You will receive the Gift Card(s) as per timelines in the terms and conditions of the orrder. Please refer the following steps below: \n- Log in to your Shop2more account \n- Click on 'Orders' under 'My Account' \n- Mode of payment \n- Select the order for which you want to check the offer T&Cs \n- Click on the 'Offers applied' section on the right to view the T&Cs.",
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
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
            FRaisedButton(
              elevation: 0.0,
              text: "How do I check if I've received freebie as part of an offer?",
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
                                                "How do I check if I've received the freebie as part of an offer?",
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FancyText(
                                            size: 17.0,
                                            text:
                                                "You will receive the Gift Card(s) as per timelines in the terms and conditions of the orrder. Please refer the following steps below: \n- Log in to your Shop2more account \n- Click on 'Orders' under 'My Account' \n- Mode of payment \n- Select the order for which you want to check the offer T&Cs \n- Click on the 'Offers applied' section on the right to view the T&Cs.",
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
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
                      text: "When can I see the offer configured to my account, in my 'reward section'?",
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
                                                "When can I see the offer configured to my account, in my 'reward section'?",
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FancyText(
                                            size: 17.0,
                                            text:
                                                "You will be able to see the offer in your Shop2more account as per the timelines in the terms and conditions of the offer. Please refer the following steps below: \n- Log in to your Shop2more account \n- Click on 'Orders' under 'My Account' \n- Mode of payment \n- Select the order for which you want to check the offer T&Cs \n- Click on the 'Offers applied' section on the right to view the T&Cs.",
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    FRaisedButton(
                      elevation: 0.0,
                      text: "How do I check if I've received the voucher code as part of an offer?",
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
                                                "How do I check if I've received the voucher code as part of an offer?",
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FancyText(
                                            size: 17.0,
                                            text:
                                                "You will receive the voucher code as per timelines in the terms and conditions of the orrder. Please refer the following steps below: \n- Log in to your Shop2more account \n- Click on 'Orders' under 'My Account' \n- Mode of payment \n- Select the order for which you want to check the offer T&Cs \n- Click on the 'Offers applied' section on the right to view the T&Cs.",
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
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
