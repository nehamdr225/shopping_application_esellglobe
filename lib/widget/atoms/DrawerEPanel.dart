import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListItem {
  final WidgetBuilder bodyBuilder;
  final title;
  final String subtitle;
  bool isExpandedInitially;

  ListItem({
    @required this.bodyBuilder,
    this.title ,
    this.subtitle = "",
    this.isExpandedInitially = false,
  })  : assert(title != null),
        assert(bodyBuilder != null);

  ExpansionPanelHeaderBuilder get headerBuilder =>
      (context, isExpanded) => new Row(children: [
            new SizedBox(width: 60.0, child: new Image.asset(title, height: 20.0, width: 20.0, color: Colors.black87,)),
            new Text(subtitle)
          ]);
}

class DrawerEPanel extends StatefulWidget {
  final List<ListItem> items;

  DrawerEPanel(this.items) {
    assert(new Set.from(items.map((li) => li.subtitle)).length == items.length);
  }

  @override
  State<StatefulWidget> createState() => new DrawerEPanelState();
}

class DrawerEPanelState extends State<DrawerEPanel> {
  Map<String, bool> expandedByTitle = new Map();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
          child: new ExpansionPanelList(
        children: widget.items
            .map(
              (item) => new ExpansionPanel(
                  headerBuilder: item.headerBuilder,
                  body: new Builder(builder: item.bodyBuilder),
                  isExpanded:
                      expandedByTitle[item.title] ?? item.isExpandedInitially),
            )
            .toList(growable: false),
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            expandedByTitle[widget.items[index].title] = !isExpanded;
          });
        },
      ),
    );
  }
}