import 'package:esell/widget/atoms/Details.dart';
import 'package:esell/widget/atoms/ImageHolder.dart';
import 'package:flutter/material.dart';
import 'package:esell/pages/ProductDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class Product extends StatelessWidget {
  final name;
  final image;
  final double imgheight;
  final price;
  final details;
  final bool showDetails;
  final id;
  final wishlist;

  Product(
      {this.name,
      this.price,
      this.image,
      this.imgheight,
      this.details,
      this.wishlist,
      this.showDetails: true,
      this.id});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    var preview = '';
    if (image != null) {
      if (image['front'] == null) {
        if (image['left'] != null) {
          preview = image['left'];
        } else if (image['right'] != null) {
          preview = image['right'];
        } else if (image['back'] != null) {
          preview = image['back'];
        } else if (image['top'] != null) {
          preview = image['top'];
        } else if (image['bottom'] != null) {
          preview = image['bottom'];
        }
      } else {
        preview = image['front'];
      }
    }
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(id: id)));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: ImageHolder(
                        image: preview,
                        imgheight: imgheight,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          CupertinoIcons.heart_solid,
                        ),
                        focusColor: Colors.red,
                        color: user.findWishlistItem(id) != true
                            ? Colors.grey[600]
                            : Colors.red,
                        onPressed: () {
                          user.findWishlistItem(id) != true
                              ? user.addToWishList(id)
                              : print("already in wishlist");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 2),
              Details(
                name: name,
                price: '$price',
                id: id,
                wishlist: wishlist,
                details: details, 
                showDetails : showDetails
                //paddingTop: paddingTop,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
