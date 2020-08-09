import 'package:esell/entities/product.dart';
import 'package:esell/models/product.model.dart';

abstract class CartModel {
  ProductModel product;
  DateTime timestamp;
  int quantity;
  String size;
  String color;
}

class CartItem implements CartModel {
  ProductModel product;
  DateTime timestamp;
  int quantity;
  String size;
  String color;

  CartItem.fromJson(json)
      : this.product = Product.fromJson(json['product']),
        this.timestamp = json['timestamp'],
        this.quantity = json['quantity'],
        this.size = json['size'],
        this.color = json['color'];
}
