import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

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
    if (productModel.menCategory
        .getFromString(widget.category.split(';').first)
        .isComplete) {
      setState(() {
        status = RefreshStatus.noMoreProductsToShow;
      });
    }

    if (status != null && status == RefreshStatus.loading) {
      return Container(
        alignment: Alignment.center,
        child: CupertinoActivityIndicator(),
      );
    }
    print('Refresh status $status ${widget.category} ${widget.isNull}');
    if (status == null && widget.isNull) {
      productModel.refresh(widget.category).then((value) => setState(() {
            status = value;
          }));
      return Container(
        alignment: Alignment.center,
        child: CupertinoActivityIndicator(),
      );
    }

    if (status == RefreshStatus.noMoreProductsToShow) {
      return Container(
        alignment: Alignment.center,
        child: FlatButton.icon(
            onPressed: () {},
            icon: Icon(Icons.check),
            label: Text('No more products available!')),
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
          label: Text('View More')),
    );
  }
}

//     FutureBuilder(
//       future: ,
//       builder: (context, AsyncSnapshot<RefreshStatus> snapshot) {
//         if (snapshot.hasData) {
//           switch (snapshot.data) {
//             case RefreshStatus.noMoreProductsToShow:
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text("Nothing more to show!"),
//                   Icon(
//                     Icons.check,
//                     color: primaryDark,
//                   )
//                 ],
//               );
//             default:
//               return Container(
//                 padding:
//                     EdgeInsets.symmetric(vertical: 120.0, horizontal: 105.0),
//                 //padding: EdgeInsets.fromLTRB(105.0, 120.0, 110.0, 120.0),
//                 child: CircularProgressIndicator(
//                   backgroundColor:
//                       Theme.of(context).colorScheme.primary.withOpacity(0.5),
//                   valueColor: AlwaysStoppedAnimation(
//                     Theme.of(context).colorScheme.primary,
//                   ),
//                   strokeWidth: 5.0,
//                 ),
//               );
//           }
//         }
//         return SizedBox.shrink();
//         // CircularProgressIndicator(
//         //   valueColor: AlwaysStoppedAnimation(
//         //     Theme.of(context).colorScheme.secondary,
//         //   ),
//         //   strokeWidth: 5.0,
//         // );
//       },
//     );
//   }
// }
