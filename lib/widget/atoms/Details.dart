import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String name;
  final String price;
  final String id;
  final wishlist;
  final details;
  final bool showDetails;
  Details(
      {this.name,
      this.price,
      this.id,
      this.wishlist: true,
      this.details,
      this.showDetails});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserModel>(context);
    //var text = 'String'.replaceAll('\n', ' ');

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const  EdgeInsets.only(left: 8.0, top: 10.0),
            child: Row(
              children: <Widget>[
                Text(
                  "₹ ${widget.price}",
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w800,
                      ),
                  textAlign: TextAlign.left,
                ),
                // widget.showDetails == true
                //     ? Padding(
                //         padding:
                //             EdgeInsets.only(right: 6.0, left: 6.0, top: 3.0),
                //         child: Text(
                //           "₹ 1800",
                //           style: Theme.of(context).textTheme.bodyText2.copyWith(
                //               fontWeight: FontWeight.w500,
                //               fontSize: 12.0,
                //               color: Colors.grey[500],
                //               decoration: TextDecoration.lineThrough),
                //         ),
                //       )
                //     : Text(''),
                // widget.showDetails == true
                //     ? Padding(
                //         padding:
                //             EdgeInsets.only(right: 6.0, left: 6.0, top: 3.0),
                //         child: Text(
                //           "50% off",
                //           style: Theme.of(context).textTheme.bodyText2.copyWith(
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.green,
                //                 fontSize: 13.0,
                //               ),
                //         ),
                //       )
                //     : Text('')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 3.0),
            child: Text(
              widget.name,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          widget.details.length < 40
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 5.0, right: 2.0),
                  child: Text(
                    '${widget.details.replaceAll('\n', ' ')}...',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[500]),
                    textAlign: TextAlign.left,
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 5.0, right: 8.0),
                  child: Text(
                    '${widget.details}',//.substring(0, 40).replaceAll('\n', ' ')}...',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[500]),
                    textAlign: TextAlign.left,
                  ),
                ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
