import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProductModel>(context).refresh();
    return Container(
      child: Row(
        children: <Widget>[
          state != null && state == "done"
              ? Column(
                  children: <Widget>[
                    Text("Seems we are done!"),
                    Icon(Icons.check)
                  ],
                )
              : CircularProgressIndicator()
        ],
      ),
    );
  }
}
