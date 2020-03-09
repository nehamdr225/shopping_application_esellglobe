import 'package:esell/widget/HelpCenter/ContactUs.dart';
import 'package:esell/widget/HelpCenter/ContactUsCard.dart';
import 'package:esell/widget/atoms/DrawerElements.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:flutter/material.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class PDdelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final token = user.token;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
          color: Colors.white,
          child:
              //token != null
              //?
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              token != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 14.0,
                            top: 10.0,
                          ),
                          child: Text(
                            'Delivery to',
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.0, top: 10.0),
                          child: Text(
                            'Hyderabad - 500028',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 15.0, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 10.0, right: 5.0),
                          child: FRaisedButton(
                            elevation: 0.5,
                            text: "Change",
                            fontSize: 15.0,
                            bg: Colors.white,
                            color: primaryDark,
                            shape: false,
                            height: 30.0,
                            width: 100.0,
                            onPressed: () {},
                          ),
                        )
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 14.0, top: 5.0),
                      child: Text(
                        'Delivery Details',
                        style: Theme.of(context).textTheme.body1.copyWith(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
              SizedBox(
                height: 5.0,
              ),
              Divider(),
              DrawerElements(
                // usually delivery
                titleWidgets: true,
                widgets: Row(
                  children: <Widget>[
                    Image.asset(
                      "images/icons/rupee.png",
                      height: 14.0,
                    ),
                    Text(
                      '40 | Delivery in 3 - 4 Days',
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 14.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                icon: 'images/esellIcons/order.png',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContactUs(
                      title: 'Delivery details',
                      widgets: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 14.0, top: 20.0),
                                  child: Text(
                                    'Usually delivered in',
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .copyWith(fontSize: 14.0),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 14.0, top: 10.0, bottom: 15.0),
                                  child: Text(
                                    '3-4 days',
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .copyWith(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "View Details",
                                        style: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .copyWith(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: IconButton(
                                          iconSize: 12.0,
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.grey[500],
                                            size: 16.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      )
                                    ],
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
                          )
                        ],
                      ),
                    ),
                  ));
                },
              ),
              Divider(),
              DrawerElements(
                // 30 days return
                title: '30 Days Return Policy',
                iconSize: 25.0,
                icon: 'images/icons/return.png',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContactUs(
                      title: '30-days return',
                      widgets: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 14.0, top: 20.0, bottom: 10.0),
                              child: FancyText(
                                size: 16.0,
                                text:
                                    "If there is any issues with your product, you can raise a refund, replacement or exchange request within 30 days of receiving the product.",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          ContactUsCard(
                            padding: false,
                            text: 'Issue still not resolved?',
                            buttonText: 'Contact Us',
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ));
                },
              ),
              Divider(),
              DrawerElements(
                title: 'Cash on Delivery Available',
                icon: 'images/icons/cash.png',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContactUs(
                      title: 'Cash on Delivery',
                      widgets: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(left: 14.0, top: 20.0, bottom: 20.0),
                              child: FancyText(
                                size: 16.0,
                                text:
                                    "Select cash on delivery payment option while placing the order and later, pay in cash at the time of actual delivery of product. No advance payment needed.",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          ContactUsCard(
                            padding: false,
                            text: 'Issue still not resolved?',
                            buttonText: 'Contact Us',
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ));
                },
              ),
            ],
          )),
    );
  }
}
