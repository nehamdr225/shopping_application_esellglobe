import 'package:esell/data/product.model.dart';
import 'package:flutter/foundation.dart';

class Product implements ProductModel {
  String id, name, brand, article, category, stock, price, colors;
  Map sizes;
  List media;

  Product({
    @required this.id,
    @required this.name,
    @required this.article,
    @required this.category,
    @required this.brand,
    @required this.price,
    this.stock,
    this.colors,
    this.sizes,
    this.media,
  });

  Product.fromJson(jsonData) {
    this.id = jsonData['_id'];
    this.name = jsonData['name'];
    this.brand = jsonData['brand'];
    this.article = jsonData['article'];
    this.category = jsonData['category'];
    this.stock = jsonData['stock'];
    this.price = jsonData['price'];
    this.colors = jsonData['colors'];
    this.sizes = jsonData['sizes'];
    this.media = jsonData['media'];
  }
}
