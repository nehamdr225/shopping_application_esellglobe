import 'package:esell/data/product.model.dart';
import 'package:flutter/foundation.dart';

class Product implements ProductModel {
  String name, article, category, color, id;
  Map sizes;
  List media;

  Product({
    @required this.id,
    @required this.name,
    @required this.article,
    @required this.category,
    this.color,
    this.sizes,
    this.media,
  });

  Product.fromJson(jsonData) {
    this.id = jsonData['_id'];
    this.name = jsonData['name'];
    this.article = jsonData['article'];
    this.category = jsonData['category'];
    this.color = jsonData['color'];
    this.sizes = jsonData['sizes'];
    this.media = jsonData['media'];
  }
}
