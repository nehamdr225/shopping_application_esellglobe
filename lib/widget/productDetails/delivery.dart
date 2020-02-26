import 'package:esell/widget/atoms/DrawerElements.dart';
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
        child: token != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
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
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(),
                  DrawerElements(
                    titleWidgets: true,
                    widgets: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "images/icons/rupee.png",
                              height: 14.0,
                            ),
                            Text(
                              '40 | Delivery in 2 Days, Thursday',
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 14.0),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, top: 2.0),
                          child: Text(
                            'if ordered before 2:10 PM',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 13.0, color: Colors.grey[500]),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    icon: 'images/icons/van.png',
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) =>
                      //       CategoryPage(text: 'Foot Wear'),
                      // ));
                    },
                  ),
                  Divider(),
                  DrawerElements(
                    title: '30 Days Return Policy',
                    icon: 'images/icons/30days.png',
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => CategoryPage(text: 'Foot Wear'),
                      //));
                    },
                  ),
                  Divider(),
                  DrawerElements(
                    title: 'Cash on Delivery Available',
                    icon: 'images/icons/cash.png',
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => CategoryPage(text: 'Foot Wear'),
                      // ));
                    },
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 14.0, top: 20.0),
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
                    padding:
                        EdgeInsets.only(left: 14.0, top: 10.0, bottom: 15.0),
                    child: Text(
                      '3-4 days',
                      style: Theme.of(context).textTheme.body1.copyWith(
                          fontSize: 16.0, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "View Details",
                          style: Theme.of(context).textTheme.body1.copyWith(
                              fontSize: 15.0, fontWeight: FontWeight.w600),
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
    );
  }
}
