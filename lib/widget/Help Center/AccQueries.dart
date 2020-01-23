import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FRaisedButton(
            elevation: 0.0,
            text: 'I want to deactivate my esell account',
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
            text: "Something's wrong with my Wishlist",
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
          ], 
        ),
      ),
    );
  }
}
