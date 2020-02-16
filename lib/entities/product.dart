import 'package:esell/data/product.model.dart';
import 'package:flutter/foundation.dart';

class Product implements ProductModel {
  String id, name, brand, article, category, price, gender;
  String sizes, colors, stock;
  Map<String, String> media;
  Map description;
  String timestamp;
  String sellerId;
  String paymentMethod;

  Product({
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
    this.gender = jsonData['gender'];
    this.description = jsonData['description'];
    this.paymentMethod = jsonData['paymentMethod'];
    this.sellerId = jsonData['sellerId'];
    this.timestamp = jsonData['timestamp'];
  }
}
