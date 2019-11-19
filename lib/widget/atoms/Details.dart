import 'package:esell/state/state.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final String name;
  final String price;
  final String id;
  Details({this.name, this.price, this.id});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistModel>(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
        ),
        Text(
          widget.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          textAlign: TextAlign.center,
        ),
        Row(children: <Widget>[
          Expanded(
              child: Text(
            widget.price,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: FIcons(
                  icon: Icons.bookmark_border,
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    wishlist.find(widget.id) != true
                        ? wishlist.setOne = widget.id
                        : print("already in wishlist");
                  },
                  
                  ))
        ]),
      ],
    );
  }
}
