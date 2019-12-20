import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> tabItems;

  TabView({this.tabs, this.tabItems});
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int activeIndex = 0;

  handleTabChange(each) {
    final index = widget.tabs.indexOf(each);
    if (index > -1 && index != activeIndex) {
      setState(() {
        activeIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.tabs.map<Widget>((each) {
            return FlatButton(
              child: Text(each),
              onPressed: () {
                handleTabChange(each);
              },
            );
          }).toList(),
        ),
        Container(
          child: widget.tabItems[activeIndex],
        )
      ],
    );
  }
}
