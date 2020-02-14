import 'package:esell/widget/molecules/SliverApBar.dart';
import 'package:flutter/material.dart';

class Queries extends StatefulWidget {
  final Widget widgets;
  final title;
  Queries({this.widgets, this.title});
  @override
  _QueriesState createState() => _QueriesState();
}

class _QueriesState extends State<Queries> with SingleTickerProviderStateMixin {
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
    //final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.background,
        body: NestedScrollView(
          controller: _scrollViewController,
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverApBar(
                innerBoxIsScrolled: innerBoxIsScrolled,
                title: widget.title,
              )
            ];
          },
          body: widget.widgets
      )),
    );
  }
}