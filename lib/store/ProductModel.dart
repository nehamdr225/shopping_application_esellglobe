import 'package:flutter/cupertino.dart';

class ProductModel extends ChangeNotifier {
  List _products = [];

  List get products => _products;

  one(name) {
    for (var item in products) {
      if (item['name'] == name) return item;
      return {'error': 'Product not found!'};
    }
  }

  set product(item) {
    _products.add(item);
    notifyListeners();
  }

  set products(items) {
    // for(var product in items){
    // }
    _products.addAll(items);
    notifyListeners();
  }
}
