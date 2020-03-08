import 'package:flutter/material.dart';

class DrawerElements extends StatelessWidget {
  final String title;
  final icon;
  final iconSize;
  final onTap;
  final bool titleWidgets;
  final Widget widgets;
  DrawerElements(
      {this.title,
      this.icon,
      this.iconSize: 30.0,
      this.onTap,
      this.titleWidgets: false,
      this.widgets});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: titleWidgets == false
          ? Text(title, style: Theme.of(context).textTheme.caption)
          : widgets,
      leading: Image.asset(
        icon,
        height: iconSize,
        width: iconSize,
      ),
      trailing: Icon(Icons.arrow_right),
      onTap: onTap,
    );
  }
}
