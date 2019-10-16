import 'package:esell/helpers/Api.dart';
import 'package:flutter/cupertino.dart';

class ProductModel extends ChangeNotifier {
  ProductModel() {
    getProducts().then((data) {
      if (data['error'] == null)
        products = data['result'];
      else
        print(data['error']);
    });
  }
  List _products = [];

  List get products => _products;
  get count => _products.length;
  one(id) {
    for (var item in _products) {
      if (item['_id'] == id) return item;
    }
    return {'error': 'Product not found!'};
  }

  category(String cat) {
    return _products.where((product) {
      return product["category"].contains(cat.toLowerCase());
    }).toList();
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
