import 'dart:core';

import 'package:esell/entities/product.api.dart';
import 'package:esell/entities/product.dart';
// import 'package:esell/entities/product.dart';
// import 'package:esell/data/product.model.dart';
import 'package:flutter/cupertino.dart';

class ProductModel extends ChangeNotifier {
  final ProductApi _api;
  ProductModel(this._api) {
    _api.getProducts(page: page).then((data) {
      print(data);
      if (data['error'] == null) {
        final products = data['products']
            .map<Product>((each) => Product.fromJson(each))
            .toList();
        setProducts(products);
        maxCount = products['count'];
      } else
        print(data['error']);
    });
  }
  Map<String, List<Product>> _menProducts = {
    'Top Wear': [],
    'Bottom Wear': [],
    'Foot Wear': [],
    'Bags & Backpacks': [],
    'Sunglasses': [],
    'Watches': [],
  };

  // Map<String, List<Product>> _womenProducts = {
  //   'Top Wear': [],
  //   'Bottom Wear': [],
  //   'Foot Wear': [],
  //   'Bags & Backpacks': [],
  //   'Sunglasses': [],
  //   'Watches': [],
  // };

  int _maxCount;
  int _page = 1;
  bool _isRefreshing = false;

  Map<String, bool> menCategories = {
    'Top Wear': false,
    'Bottom Wear': false,
    'Foot Wear': false,
    'Bags & Backpacks': false,
    'Sunglasses': false,
    'Watches': false,
  };

  Map<String, bool> womenCategories = {
    'Top Wear': false,
    'Bottom Wear': false,
    'Foot Wear': false,
    'Bags & Backpacks': false,
    'Sunglasses': false,
    'Watches': false,
  };

  List<Product> products(String category) => _menProducts[category];

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

  Product one(String id, String category) {
    return _menProducts[category]
        .firstWhere((element) => element.id == id, orElse: () => null);
  }

  List<Product> category(String cat, String sub) {
    return products(cat)
        .where((element) => element.category.contains(sub))
        .toList();
  }

  product(Product item, String category) {
    if (!products(category).any((each) => each.id == item.id)) {
      _menProducts[category].add(item);
      notifyListeners();
    }
  }

  setProducts(List<Product> items) {
    for (final item in items) {
      if (item.category.contains('Top Wear'))
        _menProducts['Top Wear'].add(item);
      if (item.category.contains('Bottom Wear'))
        _menProducts['Bottom Wear'].add(item);
      if (item.category.contains('Foot Wear'))
        _menProducts['Foot Wear'].add(item);
      if (item.category.contains('Bags & Backpacks'))
        _menProducts['Bags & Backpacks'].add(item);
      if (item.category.contains('Sunglasses'))
        _menProducts['Sunglasses'].add(item);
      if (item.category.contains('Watches')) _menProducts['Watches'].add(item);
    }
    notifyListeners();
  }

  getProductsByCategory(String category) async {
    Map<String, List> res =
        await _api.getProductsByCategory(category: category);
    if (res['products'] != null) {
      setProducts(res['products'].map((e) => Product.fromJson(e)).toList());
    }
  }

  Future<RefreshStatus> refresh() async {
    try {
      if (maxCount != null && page * 15 >= maxCount)
        return RefreshStatus.noMoreProductsToShow;
      if (_isRefreshing) return RefreshStatus.loading;

      print('here');
      print(page);
      _isRefreshing = true;
      Map<String, dynamic> res = await _api.getProducts(page: page + 1);
      if (res['products'].length > 0) {
        print(res);
        page = page + 1;
        final List<Product> prods =
            res['products'].map<Product>((e) => Product.fromJson(e)).toList();
        setProducts(prods);
        _isRefreshing = false;
        return RefreshStatus.loaded;
      }
      _isRefreshing = false;
      return RefreshStatus.done;
    } catch (e) {
      print(e);
      _isRefreshing = false;
      return RefreshStatus.done;
    }
  }

  relevant(String prodCategory) {
    List<Product> frequentlyBroughtTogether = [];
    frequentlyBroughtTogether.add(_menProducts[prodCategory].first);
    frequentlyBroughtTogether.add(_menProducts[prodCategory].last);
    return frequentlyBroughtTogether;
  }
}

enum RefreshStatus {
  noMoreProductsToShow,
  loading,
  loaded,
  done,
}
