import 'package:flutter/material.dart';

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
            child: Text(
                widget.price,
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.left,
              ),
          )
            
          
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