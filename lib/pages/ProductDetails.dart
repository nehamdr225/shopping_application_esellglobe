import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/productDetails/BoughtTogether.dart';
import 'package:esell/widget/productDetails/Carousel.dart';
import 'package:esell/widget/productDetails/Comments.dart';
import 'package:esell/widget/productDetails/PDratingNreview.dart';
import 'package:esell/widget/productDetails/SoldBy.dart';
import 'package:esell/widget/productDetails/allDetails.dart';
import 'package:esell/widget/productDetails/delivery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/widget/productDetails/details.dart';
import 'package:esell/state/state.dart';

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

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final product =
        Provider.of<ProductModel>(context).one(widget.id, widget.category);
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
    // Map<String, dynamic> images;
    //  = {
    //   'front': '',
    //   'back': '',
    //   'left': '',
    //   'right': '',
    //   'top': '',
    //   'bottom': ''
    // };
    if (product == null) return Text('Error occured fetching product info!');

    return SafeArea(
      child: Scaffold(
        persistentFooterButtons: <Widget>[
          PDFooter(
              id: widget.id,
              quantity: quantity,
              size: size,
              color: color,
              category: product.category)
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
              child: PDCarousel(
                images: images,
                length: imgNo,
                id: widget.id,
                width: screenWidth,
              ),
            ),
            PDInfo(
              category: widget.category,
              id: product.id,
              color: color,
              size: size,
              setSize: setSize,
              setColor: setColor,
            ),
            //PDoffer(),
            // !product['category'].contains('Sunglasses') &&
            //         !product['category'].contains('Watches') &&
            //         !product['category'].contains('Bags & Backpacks')
            //     ? PDSizeSelector(
            //         sizes: product['sizes'],
            //         setSize: setSize,
            //         size: size,
            //         foot: product['category'].contains('Foot Wear'),
            //       )
            //     : Text(''),

            //PDplusmember(),
            PDdelivery(),
            PDsoldby(),
            InfoNavBar(
              text: 'View All Details',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PDAllDetails(
                    id: widget.id,
                    category: product.category,

                    // colors: product['colors'],
                    // sizes: product['sizes'],
                  ),
                ));
              },
            ),
            PDBoughtTogether(
              // details: product['description'],
              // price: product['price'],
              // id: widget.id,
              // image: product.media.front,
              // name: product['name'],
              relevantProds: relatedProds,
            ),
            PDratingNreview(),
            PDcomments(),
            Padding(
              padding: EdgeInsets.all(3.0),
            )
          ],
        ),
      ),
    );
  }
}
