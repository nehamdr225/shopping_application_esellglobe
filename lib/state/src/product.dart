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
  bool _isRefreshing = false;

  get isRefreshing => _isRefreshing;
  set isRefreshing(value) {
    _isRefreshing = value;
    notifyListeners();
  }

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
    return products.where((product) {
      return product["category"].contains(cat.toLowerCase());
    }).toList();
  }

  set product(Map item) {
    if (products.firstWhere((each) => each['_id'] == item['_id']).length == 0)
      _products.add(item);
    notifyListeners();
  }

  set products(List items) {
    if (products.length > 0) {
      final filtered = items.where((test) {
        final tests = _products.any((el) => el['_id'] == test['_id']);
        print(tests);
        return tests;
      }).toList();
      print("filtered");
      print(filtered);
      _products.addAll(filtered);
    } else {
      _products = items;
    }
    notifyListeners();
  }

  refresh() {
    try {
      if (count < maxCount && !isRefreshing) {
        isRefreshing = true;
        print("refresh $page");
        getProducts(page: page + 1).then((data) {
          if (data['error'] == null) {
            if (maxCount != data['count']) maxCount = data['count'];
            products = data['products'];
            page = page + 1;
            isRefreshing = false;
            return "done";
          } else {
            print(data['error']);
            isRefreshing = false;
            return "Oops something wrong happened!";
          }
        });
      } else {
        isRefreshing = false;
        return "done";
      }
    } catch (e) {
      isRefreshing = false;
      return "done";
    }
  }
}
