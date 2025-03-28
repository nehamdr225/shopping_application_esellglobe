import 'package:esell/entities/user.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/productDetails/Carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:esell/widget/productDetails/details.dart';
import 'package:esell/state/state.dart';
import 'package:esell/entities/product.dart';

class ProductDetails extends StatefulWidget {
  final String id, category;
  ProductDetails({this.id, this.category});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String color, size;
  void setSize(String newSize) {
    if (newSize != size)
      setState(() {
        size = newSize;
      });
  }

  void setColor(String newColor) {
    if (newColor != color)
      setState(() {
        color = newColor;
      });
  }

  int quantity = 1;
  Product product;
  UserRating userRatingForProduct;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    if (product == null) {
      Provider.of<ProductModel>(context)
          .getProductDetails(widget.id)
          .then((value) {
        setState(() {
          print(value);
          product = Product.fromJson(value);
        });
      });
      if (userRatingForProduct == null)
        Provider.of<UserModel>(context).getUserRatingForProduct(widget.id).then(
            (value) => value != null
                ? setState(() => userRatingForProduct = value)
                : null);
      return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: FAppBar(
              wishlist: true,
              title: "",
              cart: true,
            ),
          ),
          body: Center(
              child: CupertinoActivityIndicator(
            radius: 18.0,
          )));
    }
    final relatedProds =
        Provider.of<ProductModel>(context).relevant(widget.category);

    final imagesrc = "https://api.shop2more.com";

    List<Image> images = [];
    int imgNo = product.media.length;
    if (product.media != null) {
      if (product.media.front != null)
        images.add(Image.network(imagesrc + product.media.front));

      if (product.media.back != null)
        images.add(Image.network(imagesrc + product.media.back));

      if (product.media.left != null)
        images.add(Image.network(imagesrc + product.media.left));

      if (product.media.right != null)
        images.add(Image.network(imagesrc + product.media.right));

      if (product.media.top != null)
        images.add(Image.network(imagesrc + product.media.top));

      if (product.media.bottom != null)
        images.add(Image.network(imagesrc + product.media.bottom));
    } else {
      images.add(Image.network(' '));
    }

    if (product == null) return Text('Error occured fetching product info!');

    return SafeArea(
      child: Scaffold(
        persistentFooterButtons: <Widget>[
          PDFooter(
            id: widget.id,
            quantity: quantity,
            size: size,
            color: color,
            category: product.category,
            product: product,
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            title: "",
            cart: true,
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: screenHeight * 0.50,
              width: screenWidth,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                      height: 40.0,
                      color: Theme.of(context).colorScheme.background,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40.0),
                            ),
                            color: Colors.white),
                      )),
                  PDCarousel(
                    images: images,
                    length: imgNo,
                    id: widget.id,
                    width: screenWidth,
                  ),
                ],
              ),
            ),
            PDInfo(
              relatedProd: relatedProds,
              category: product.category,
              id: product.id,
              color: color,
              size: size,
              setSize: setSize,
              setColor: setColor,
              colors: product.colors,
              description: product.description['style'],
              name: product.name,
              price: product.price,
              sizes: product.sizes,
              rating: product.rating,
              userRating: userRatingForProduct ?? UserRating(),
            ),
            Padding(
              padding: EdgeInsets.all(3.0),
            )
          ],
        ),
      ),
    );
  }
}
