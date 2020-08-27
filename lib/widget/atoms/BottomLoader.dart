import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

final Widget indicator = Container(
  alignment: Alignment.center,
  child: CupertinoActivityIndicator(radius: 18),
);

class BottomLoader extends StatefulWidget {
  final String category;
  final bool isNull;
  BottomLoader({this.category, this.isNull = false});
  @override
  _BottomLoaderState createState() => _BottomLoaderState();
}

class _BottomLoaderState extends State<BottomLoader> {
  RefreshStatus status;
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);
    final bool isComplete = productModel.menCategory
        .getFromString(widget.category.split(';').first)
        .isComplete;

    if (isComplete) {
      setState(() {
        status = RefreshStatus.noMoreProductsToShow;
      });
    }

    if (status != null && status == RefreshStatus.loading) {
      return indicator;
    }

    // print('Refresh status $status ${widget.category} ${widget.isNull}');
    if (status == null && widget.isNull) {
      productModel.refresh(widget.category).then(
            (value) => setState(
              () {
                status = value;
              },
            ),
          );
      return indicator;
    }

    if (status == RefreshStatus.noMoreProductsToShow) {
      return Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check),
            Text('No more products available!')
          ],
        ),
      );
    }

    if (status == RefreshStatus.error) {
      return Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check),
            Text('Internal error ocurred!')
          ],
        ),
      );
    }

    return Container(
      alignment: Alignment.center,
      child: FlatButton.icon(
        onPressed: () async {
          final localStatus = await productModel.refresh(widget.category);
          setState(() {
            status = localStatus;
          });
        },
        icon: Icon(Icons.arrow_downward),
        label: Text('View More'),
      ),
    );
  }
}
