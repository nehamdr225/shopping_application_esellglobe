import 'package:flutter/material.dart';

class DrawerElements extends StatelessWidget {
  final String title;
  final icon;
  final iconSize;
  final onTap;
  final bool titleWidgets;
  final Widget widgets;
  final Widget iconWidget;
  final style;
  DrawerElements(
      {this.title,
      this.icon,
      this.iconSize: 30.0,
      this.onTap,
      this.iconWidget,
      this.titleWidgets: false,
      this.widgets,
      this.style});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: titleWidgets == false
          ? Text(title, style: style)
          : widgets,
      leading: iconWidget ??
          Image.asset(
            icon,
            height: iconSize,
            width: iconSize,
            //color: gradient,
          ),
      // trailing: Icon(Icons.arrow_right),
      onTap: onTap,
    );
  }
}
