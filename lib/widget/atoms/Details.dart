import 'package:esell/state/state.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final String name;
  final String price;
  final String id;
  final wishlist;
  Details({this.name, this.price, this.id, this.wishlist:true});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
        ),
        Text(
          widget.name,
          style: Theme.of(context).textTheme.body1.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Expanded(
              child: Text(
            widget.price,
            style: Theme.of(context).textTheme.body1.copyWith(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
          )),
          widget.wishlist == true? 
          Expanded(
            child: FIcons(
            icon: user.findWishlistItem(widget.id) != true 
            ? Icons.bookmark_border
            : Icons.bookmark,
            color: iconthemedark,
            alignment: Alignment.centerRight,
            onPressed: () {
              user.findWishlistItem(widget.id) != true
                  ? user.addToWishList(widget.id)
                  : print("already in wishlist");
            },
          )
          )
          :Text('')
        ]),
      ],
    );
  }
}
