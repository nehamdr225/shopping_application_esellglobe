import 'package:esell/state/state.dart';
import 'package:esell/widget/HelpCenter/ContactUs.dart';
import 'package:esell/widget/HelpCenter/ContactUsCard.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/SliverApBar.dart';
import 'package:flutter/material.dart';

class ServiceQueries extends StatefulWidget {
  @override
  _ServiceQueriesState createState() => _ServiceQueriesState();
}

class _ServiceQueriesState extends State<ServiceQueries>
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
              title: 'Esell Service Queries',
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
                  text: 'I want to avail the warranty for my item',
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
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: FancyText(
                                                fontWeight: FontWeight.w500,
                                                size: 17.0,
                                                text:
                                                    "I don't remember the warranty details for my product. Where can I find it?",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: FancyText(
                                                size: 17.0,
                                                text:
                                                    "You can check the brand website for the warranty details of your product. The product invoice can be used to claim the services from any Authorised Service Centre.",
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
            ),
            FRaisedButton(
                elevation: 0.0,
                text:
                    "I want to know the details of the authorised service centres for an item",
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
                                                  "I don't remember the warranty details for my product. Where can I find it?",
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: FancyText(
                                              size: 17.0,
                                              text:
                                                  "You can check the brand website for the warranty details of your product. The product invoice can be used to claim the services from any Authorised Service Centre.",
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
          ],
        ),
      ),
    );
  }
}
