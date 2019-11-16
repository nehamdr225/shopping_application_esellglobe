import 'package:esell/state/state.dart';
import 'package:esell/widget/containers/ProductGrid.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/SubMainSlider.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String text;
  CategoryPage({this.text});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final cat = text == 'Top Wear'
        ? SubMain['top']
        : text == 'Bottom Wear'
            ? SubMain['bottom']
            : text == "Foot Wear" ? SubMain['shoes'] : SubMain['glasses'];

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: FAppBar(wishlist: true, cart: true),
            ),
            body: ListView(
              children: <Widget>[
                // Container(
                //   child: SubMainSlider(
                //     listViews: cat,
                //   ),
                // ),
                Container(
                  child: Expansion(),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                ),
                Container(
                    height: height * (80 / 100),
                    child: OrientationBuilder(builder: (context, orientation) {
                      return ProductGrid(
                        orientation: orientation,
                        category: MAPPER[text],
                      );
                    }))
              ],
            )));
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
class Expansion extends StatefulWidget {
  Expansion({Key key}) : super(key: key);

  @override
  _ExpansionState createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> {
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        // setState(() {
        //   _data[index].isExpanded = !isExpanded;
        // });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                // setState(() {
                //   _data.removeWhere((currentItem) => item == currentItem);
                // });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}