import 'package:EsellGlobe/helpers/Api.dart';
import 'package:flutter/cupertino.dart';

class ProductModel extends ChangeNotifier {
  ProductModel(){
    getProducts().then((data) {
      products = data;
    });
  }
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
    _products.addAll(items);
    notifyListeners();
  }
}
