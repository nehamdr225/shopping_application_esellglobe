import 'package:flutter/foundation.dart';

class ProductModel {
  String name, article, category;
  ProductModel({
    @required this.name,
    @required this.article,
    @required this.category,
  });

  ProductModel.fromJson(jsonData) {
    this.name = jsonData['name'];
    this.article = jsonData['article'];
    this.category = jsonData['category'];
  }
}
