import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String name;
  final String price;
  final String id;
  final wishlist;
  Details({this.name, this.price, this.id, this.wishlist: true});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserModel>(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 3.0),
            child: Text(
              widget.name,
              style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 3.0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  "images/icons/rupee.png",
                  height: 14.0,
                ),
                Text(
                  widget.price,
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6.0, left: 6.0),
                  child: Text(
                    " 1800",
                    style: Theme.of(context).textTheme.body1.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0,
                        color: Colors.grey[500],
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6.0, left: 6.0),
                  child: Text(
                    "50% off",
                    style: Theme.of(context).textTheme.body1.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                          fontSize: 15.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0,)
        ],
      ),
    );
  }
}
// widget.wishlist == true?
//           Expanded(
//             child: FIcons(
//             icon: user.findWishlistItem(widget.id) != true
//             ? Icons.bookmark_border
//             : Icons.bookmark,
//             color: iconthemedark,
//             alignment: Alignment.centerRight,
//             onPressed: () {
//               user.findWishlistItem(widget.id) != true
//                   ? user.addToWishList(widget.id)
//                   : print("already in wishlist");
//             },
//           )
//           )
//           :Text('')
