import 'package:esell/widget/atoms/BrandLogos.dart';
import 'package:esell/widget/atoms/Details.dart';
import 'package:esell/widget/atoms/ImageHolder.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:flutter/material.dart';
import 'package:esell/pages/ProductDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class Product extends StatelessWidget {
  final imgheight;
  final category;
  final id;
  final wishlist;
  final showDetails;

  Product(
      {this.category,
      this.wishlist,
      this.showDetails: true,
      this.id,
      this.imgheight});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final product = Provider.of<ProductModel>(context).one(id, category);
    String preview = product.media.front ??
        product.media.back ??
        product.media.bottom ??
        product.media.top ??
        product.media.left ??
        product.media.right;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ProductDetails(id: id, category: category)));
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
                            user.token != null
                                ? user.findWishlistItem(id) != true
                                    ? user.addToWishList(id)
                                    : print("already in wishlist")
                                : _showBottomSheet(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 2),
                Details(
                    name: product.name,
                    price: product.price,
                    id: id,
                    wishlist: wishlist,
                    details: product.description['details'],
                    showDetails: showDetails
                    //paddingTop: paddingTop,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              height: 350.0,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.centerRight,
                    color: primaryDark,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  BrandLogos(
                    height: 90.0,
                    width: 90.0,
                  ),
                  LoginOptions(),
                ],
              ),
            ),
          );
        });
  }
}
