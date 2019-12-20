import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';


class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() { 
    super.initState();
    setState(() {
      tabController = TabController(
        length: 3,
        vsync: this,
      );
    });  
  }
  @override
  void dispose() { 
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          controller: tabController,
                labelStyle: Theme.of(context).textTheme.title,
                labelColor: Theme.of(context).colorScheme.secondary,
                unselectedLabelColor: textColor,
                indicatorColor: Theme.of(context).colorScheme.secondary,
                tabs: <Widget>[
                  Tab(
                    text: "Style",
                  ),
                  Tab(
                    text: "Details",
                  ),
                  Tab(
                    text: "Review",
                  ),
                ],
              ),
        TabBarView(
          controller: tabController,
          children: <Widget>[
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ],
    
        
        
      
    );
  }
}
