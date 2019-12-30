import 'package:flutter/foundation.dart';

abstract class ProductModel {
  final String id, name, brand, article, category, stock, price, colors;
  final Map sizes;
  final List media;

  ProductModel(
      {@required this.id,
      @required this.name,
      @required this.article,
      @required this.category,
      @required this.brand,
      @required this.price,
      this.colors,
      this.sizes,
      this.media,
      this.stock});
}
