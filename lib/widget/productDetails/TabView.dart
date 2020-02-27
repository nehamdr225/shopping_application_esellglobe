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
            return InkWell(
              onTap: () {
                handleTabChange(each);
              },
              child: Container(
                alignment: Alignment.center,
                height: 40.0,
                width: 110.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: widget.tabs.indexOf(each) == activeIndex
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.white,
                  width: 2.0,
                ))),
                child: Text(
                  each,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 16.0),
                ),
              ),
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
