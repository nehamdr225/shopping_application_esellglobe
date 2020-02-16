import 'package:flutter/foundation.dart';

abstract class ProductModel {
  final String id, name, brand, article, category, price, gender;
  final String sizes, colors, stock;
  final Map<String, String> media;
  final Map description;
  final String timestamp;
  final String sellerId;
  final String paymentMethod;

  ProductModel({
    @required this.id,
    @required this.name,
    @required this.article,
    @required this.category,
    @required this.brand,
    @required this.price,
    @required this.timestamp,
    @required this.sellerId,
    @required this.paymentMethod,
    @required this.description,
    @required this.media,
    @required this.stock,
    this.gender,
    this.colors,
    this.sizes,
  });
}
