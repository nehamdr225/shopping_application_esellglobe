import 'package:esell/helpers/Api.dart';
import 'package:flutter/cupertino.dart';

class ProductModel extends ChangeNotifier {
  ProductModel() {
    getProducts(page: page).then((data) {
      print(data['count']);
      if (data['products'] != null && data['error'] == null) {
        products = data['products'];
        maxCount = data['count'];
      } else
        print(data['error']);
    });
  }
  List _products = [];
  int _maxCount;
  int _page = 1;

  List get products => _products;
  get count => _products.length;
  get maxCount => _maxCount;
  set maxCount(value) {
    _maxCount = value;
    notifyListeners();
  }

  get page => _page;
  set page(value) {
    _page = value;
    notifyListeners();
  }

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

  set product(Map item) {
    if (!products.firstWhere((each) => each['_id'] == item['_id']))
      _products.add(item);
    notifyListeners();
  }

  set products(List items) {
    if (products.length > 0) {
      final filtered = items.where(
          (test) => !products.firstWhere((each) => each['_id'] == test['_id']));
      _products.addAll(filtered);
    } else {
      print(items);
      _products = items;
    }
    notifyListeners();
  }

  refresh() {
    if (count < maxCount) {
      print("refresh $count");
      getProducts(page: page + 1).then((data) {
        if (!data['error']) {
          if (maxCount != data['count']) maxCount = data['count'];
          products = data['result'];
          page = page + 1;
          if (count < maxCount) return "halfway";
          if (count >= maxCount) return "done";
        } else {
          print(data['error']);
          return "Oops something wrong happened!";
        }
      });
    } else
      return "done";
  }
}
