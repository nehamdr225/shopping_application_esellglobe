import 'package:flutter/material.dart';
import 'package:EsellGlobe/SubCategory/CategoryPage.dart';
import 'package:provider/provider.dart';
import '../store/ProductModel.dart';
// import 'package:EsellGlobe/helpers/Api.dart';

class FSlider extends StatelessWidget {
  final products;
  FSlider({this.products});

  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Categories', style: Theme.of(context).textTheme.title),
          ),
          HorizontalList(),
        ],
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'images/tshirt.png',
            imageCaption: 'Top Wear',
          ),
          Category(
            imageLocation: 'images/pant.png',
            imageCaption: 'Bottom Wear',
          ),
          Category(
            imageLocation: 'images/shoe.png',
            imageCaption: 'Foot Wear',
          ),
          Category(
            imageLocation: 'images/shoe.png',
            imageCaption: 'Watches & Glasses',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  final products;

  Category({this.imageCaption, this.imageLocation, this.products});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductModel>(context);
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CategoryPage(products: product.products)));
          },
          child: Container(
              width: 90.0,
              child: ListTile(
                title: Image.asset(
                  imageLocation,
                  width: 100.0,
                  height: 35.0,
                ),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    imageCaption,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Ropa Sans', fontSize: 12.0),
                  ),
                ),
              )),
        ));
  }
}
