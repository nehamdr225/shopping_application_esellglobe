import 'package:esell/state/state.dart';
import 'package:esell/widget/HelpCenter/ContactUs.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/HelpCenter/ContactUsCard.dart';
import 'package:esell/widget/molecules/SliverApBar.dart';
import 'package:flutter/material.dart';

class AccQueries extends StatefulWidget {
  @override
  _AccQueriesState createState() => _AccQueriesState();
}

class _AccQueriesState extends State<AccQueries>
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
              title: 'Account Queries',
            )
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FRaisedButton(
              elevation: 0.0,
              text: 'I want to deactivate my Shop2more account',
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
                                                'How can I deactivate my Shop2more account?',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FancyText(
                                            size: 17.0,
                                            text:
                                                'To deactivate yor Esell account, follow these simple steps',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: FancyText(
                                            size: 17.0,
                                            textAlign: TextAlign.left,
                                            text:
                                                "1. Log into your Shop2more account \n2. Go to My Account > Settings > Deactivate \n3. Enter the password for your account \n4. Choose 'Confirm Deactivation'",
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
              height: 50.0,
              mainAxisAlignment: MainAxisAlignment.start,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
            ),
            FRaisedButton(
              elevation: 0.0,
              text: "Something's wrong with my Wishlist",
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
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
