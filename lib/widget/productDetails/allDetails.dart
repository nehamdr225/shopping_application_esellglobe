import 'package:esell/state/state.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> properties(String category) {
  if (category.contains('Top Wear')) {
    return [
      'Fabric',
      'Pattern',
      'Neck',
      'Sleeve',
      'Hooded',
      'Reversible',
      'Occasion'
    ];
  } else if (category.contains('Bottom Wear')) {
    return [
      'Fabric',
      'Faded',
      'Rise',
      'Distressed',
      'Fit',
      'Pocket Type',
      'Reversible',
      'Closure',
      'Stretchable',
      'Fly',
      'Occasion'
    ];
  } else if (category.contains('Foot Wear')) {
    return [
      'Inner Material',
      'Sole Material',
      'Closure',
      'Occasion',
      'Pattern',
      'Tip Shape'
    ];
  } else if (category.contains('Bags')) {
    return [
      'Material',
      'Occasion',
      'No Of Compartments',
      'No Of Pockets',
      'Width',
      'Height',
      'Closure',
      'Size'
    ];
  } else if (category.contains('Bottom Wear')) {
    return [
      'Fabric',
      'Faded',
      'Rise',
      'Distressed',
      'Fit',
      'Pocket Type',
      'Reversible',
      'Closure',
      'Stretchable',
      'Fly',
      'Occasion'
    ];
  } else if (category.contains('Watches')) {
    return [
      'Occasion',
      'Display',
      'Watch Type',
      'Dial Color',
      'Strap Color',
      'Strap Material',
      'Strap Type',
      'Strap Design',
      'Case Material',
      'Water Resistant',
      'Shock Resistant',
      'Mechanism',
      'Diameter',
      'Dual Time',
      'World Time',
      'Novelty Features',
      'Power Source',
      'Light',
      'GPS',
      'Tour Billion',
      'Clasp Type',
      'Moon Phase'
    ];
  } else {
    return [
      'Occasion',
      'Purpose',
      'Lens Color',
      'Lens Material',
      'Feature',
      'Type',
      'Frame',
      'Frame Material',
      'Frame Color',
      'Face Type',
      'UV Protection',
      'Case Type'
    ];
  }
}

class AllDetails extends StatelessWidget {
  final id;
  final category;
  AllDetails({this.id, this.category});
  @override
  Widget build(BuildContext context) {
    final product =
        Provider.of<ProductModel>(context).one(id, category.split(';').first);
    final theme = Theme.of(context);
    final property = properties(category);

    Padding oneProperty(String x) {
      var combi = x.replaceAll(' ', '');
      var newName = combi.substring(0, 1).toLowerCase() + combi.substring(1);
      return product.description[newName] != null &&
              product.description[newName].length > 0
          ? Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                product.description['newName'] != null
                    ? "$x - ${product.description['newName']}"
                    : "$x - N/A",
                style: theme.textTheme.caption,
              ),
            )
          : Padding(
            padding: const EdgeInsets.only(top:0.0),
            child: SizedBox.shrink(),
          );
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: FAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Text("Product Details", style: theme.textTheme.headline6),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
              child: Text(
                product.description['details'] != null
                    ? product.description['details'].replaceAll('\n', '\n\n')
                    : "N/A",
                style: theme.textTheme.caption,
              ),
            ),
            Text("Specification", style: theme.textTheme.headline6),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          product.description['style'] != null
                              ? "Style - ${product.description['style']}"
                              : "Style - N/A",
                          style: theme.textTheme.caption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          product.description['warranty'] != null
                              ? "Warranty - ${product.description['warranty']}"
                              : "Warranty - N/A",
                          style: theme.textTheme.caption,
                        ),
                      ),
                    ] +
                    property.map<Padding>(oneProperty).toList(),
              ),
            ),
            Text("Care Instruction", style: theme.textTheme.headline6),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
              child: Text(
                product.description['care_instructions'] != null
                    ? "Care Instruction - ${product.description['care_instruction']}"
                    : "Care Instruction - N/A",
                style: theme.textTheme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
