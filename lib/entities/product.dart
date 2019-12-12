import 'package:flutter/foundation.dart';

class Product {
  String name, article, category;

  Product({
    @required this.name,
    @required this.article,
    @required this.category,
  });

  Product.fromJson(jsonData) {
    this.name = jsonData['name'];
    this.article = jsonData['article'];
    this.category = jsonData['category'];
  }
}
