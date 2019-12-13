import 'package:flutter/foundation.dart';

abstract class ProductModel {
  String name, article, category;

  ProductModel({
    @required this.name,
    @required this.article,
    @required this.category,
  });
}
