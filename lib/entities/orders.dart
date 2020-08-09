import 'package:esell/entities/product.dart';

abstract class OrderModel {
  String id;
  String buyer;
  String seller;
  Product product;
  Map productDetails;
  Map userInfo;
  Map billing;
  String status;
  String timestamp;
}

class OrderItem implements OrderModel {
  String id;
  String buyer;
  String seller;
  Product product;
  Map productDetails;
  Map userInfo;
  Map billing;
  String status;
  String timestamp;

  OrderItem.fromJson(json)
      : this.billing = json['billing'],
        this.buyer = json['buyer'],
        this.id = json['_id'],
        this.product = Product.fromJson(json['product']),
        this.productDetails = json['productDetails'],
        this.seller = json['seller'],
        this.status = json['status'],
        this.timestamp = json['timestamp'];
}
