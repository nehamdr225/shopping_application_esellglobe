import 'package:flutter/foundation.dart';

abstract class ProductModel {
  final String name, article, category, color, id;
  final Map sizes;
  final List media;

  ProductModel({
    @required this.id,
    @required this.name,
    @required this.article,
    @required this.category,
    this.color,
    this.sizes,
    this.media,
  });
}
