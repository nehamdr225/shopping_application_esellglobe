import 'package:esell/entities/product.api.dart';
// import 'package:esell/entities/product.dart';
// import 'package:esell/data/product.model.dart';
import 'package:flutter/cupertino.dart';

class ProductModel extends ChangeNotifier {
  final ProductApi _api;
  ProductModel(this._api) {
    _api.getProducts(page: page).then((data) {
      if (data['error'] == null) {
        products = data['products'];
        //.map<ProductModel>((each) => Product.fromJson(each))
        //.toList();
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

  category(List<String> cat) {
    return products.where((product) {
      return cat
          .every((each) => product["category"].contains(each.toLowerCase()));
      // return product["category"].contains(cat.toLowerCase());
    }).toList();
  }

  set product(Map item) {
    if (products.firstWhere((each) => each['_id'] == item['_id']).length == 0)
      _products.add(item);
    notifyListeners();
  }

  set products(List items) {
    if (_products.length > 0) {
      items.forEach((el) {
        final check = _products.any((product) => product['_id'] == el['_id']);
        if (!check) _products.add(el);
      });
    } else {
      _products = items;
    }
    notifyListeners();
  }

  refresh() async {
    try {
      if (maxCount != null && page * 15 < maxCount) {
        final res = await _api.getProducts(page: page + 1);
        if (res['products'].length > 0) {
          page = page + 1;
          products = res['products'];
          return "success";
        }
        return "done";
      }
      return "done";
    } catch (e) {
      print(e);
      isRefreshing = false;
      return "done";
    }
  }
}
