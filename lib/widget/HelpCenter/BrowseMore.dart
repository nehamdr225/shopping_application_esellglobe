import 'package:esell/state/state.dart';
import 'package:esell/widget/HelpCenter/ContactUs.dart';
import 'package:esell/widget/HelpCenter/ContactUsCard.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/SliverApBar.dart';
import 'package:flutter/material.dart';

class BrowseMore extends StatefulWidget {
@override
_BrowseMoreState createState() => _BrowseMoreState();
}

class _BrowseMoreState extends State<BrowseMore>
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
title: 'Help Topics',
)
];
},
body: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: <Widget>[

Padding(
  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
  child:   FRaisedButton(
          elevation: 0.0,
          text: "COMMONLY SEARCHED FAQ's",
          color: Colors.grey[500],
          textAlign: TextAlign.start,
          bg: Colors.white,
          onPressed: () {},
          width: size.width * 0.90,
          height: 45.0,
          mainAxisAlignment: MainAxisAlignment.start,
          fontSize: 15.0,
          fontWeight: FontWeight.w700,
        ),
),
      Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: FRaisedButton(
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
                                        size: 16.0,
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
                                        size: 15.0,
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
          fontSize: 15.0,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: FRaisedButton(
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
                                        size: 16.0,
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
                                        size: 15.0,
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
                                        size: 15.0,
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
                                        size: 15.0,
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
          height: 56.0,
          mainAxisAlignment: MainAxisAlignment.start,
          fontSize: 15.0,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: FRaisedButton(
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
                                        size: 16.0,
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
                                        size: 15.0,
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
          height: 56.0,
          mainAxisAlignment: MainAxisAlignment.start,
          fontSize: 15.0,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: FRaisedButton(
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
                                        size: 16.0,
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
                                        size: 15.0,
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
          height: 56.0,
          mainAxisAlignment: MainAxisAlignment.start,
          fontSize: 15.0,
        ),
      ),
      viewmore == false
          ? Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: FRaisedButton(
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
          )
          
          : Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: FRaisedButton(
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
                                                      size: 16.0,
                                                      text: "I have requested for a return for my item. \nWhen will it happen?",
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child:
                                                        FancyText(
                                                      size: 15.0,
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
                    height: 56.0,
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    fontSize: 15.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FRaisedButton(
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
                                                      size: 16.0,
                                                      text: "How long does it take to cancel an order?",
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child:
                                                        FancyText(
                                                      size: 15.0,
                                                      text: "Cancellation of item(s) in an order happens immediately if the order hasn't been shipped yet by the seller. If your order has been shipped, it will be cancelled as soon as the courier service confirms that the shipment is being returned to the seller. Orders from certain categories cannot be cancelled after 24 hours, please check the product page for more details.",
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
                    fontSize: 15.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: FRaisedButton(
                    elevation: 0.0,
                    text:
                        "I've still not received the refund in my bank account.",
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
                                                      size: 16.0,
                                                      text: "I've still not received the refund in my bank account.",
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child:
                                                        FancyText(
                                                      size: 15.0,
                                                      text: "If you have received a mail from us confrming your refund request, it means that the refund has already been initiated. You can contact your bank with the ARN you received in the email.\nIn rare events of amount not being credited by the date promised, you can contact us as we will work with the bank to get it done.",
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
                    height: 56.0,
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    fontSize: 15.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FRaisedButton(
                    elevation: 0.0,
                    text:
                        "Why can't I track my order even though it has already been shipped?",
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
                                                      size: 16.0,
                                                      text: "Why can't I track my order even though it has already been shipped?",
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child:
                                                        FancyText(
                                                      size: 15.0,
                                                      text: "Courier service takes upto 24 hours to activate tracking for an order once it's shipped. Please check again after the mentioned time frame.",
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
                    height: 62.0,
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    fontSize: 15.0,
                  ),
                ),
              
            
      Padding(
        padding: EdgeInsets.all(8.0),
      ),
  
  




],
),



]),
));
}
}
