import 'dart:core';

import 'package:esell/entities/product.api.dart';
import 'package:esell/entities/product.dart';
// import 'package:esell/entities/product.dart';
// import 'package:esell/data/product.model.dart';
import 'package:flutter/cupertino.dart';

class ProductModel extends ChangeNotifier {
  final ProductApi _api;
  ProductModel(this._api) {
    handleInitialLoad();
  }

  handleInitialLoad() async {
    final data = await _api.getProducts(page: page);
    if (data['error'] == null) {
      final products = data['products']
          .map<Product>((each) => Product.fromJson(each))
          .toList();
      setProducts(items: products);
      maxCount = data['count'];
    } else
      print(data['error']);
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

  CategoryProperties menCategory = CategoryProperties();
  CategoryProperties womenCategory = CategoryProperties();

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

  setProducts({List<Product> items, String category}) {
    if (category != null) {
      _menProducts[category.split(';').first].addAll(items);
      notifyListeners();
      return;
    }
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
      setProducts(
          items: res['products'].map((e) => Product.fromJson(e)).toList());
    }
  }

  Future<RefreshStatus> refresh(String category) async {
    try {
      final thisRef = menCategory.getFromString(category);
      if (thisRef.isComplete) return RefreshStatus.noMoreProductsToShow;
      if (_isRefreshing) return RefreshStatus.loading;
      _isRefreshing = true;
      // notifyListeners();

      Map<String, dynamic> res = await _api.getProductsByCategory(
          category: category, page: thisRef.page);
      if (res['error'] != null && res['error'] == 'Not found!') {
        _isRefreshing = false;
        thisRef.isComplete = true;
        notifyListeners();
        return RefreshStatus.noMoreProductsToShow;
      }
      if (res['result'].length > 0) {
        thisRef.page++;
        final List<Product> prods =
            res['result'].map<Product>((e) => Product.fromJson(e)).toList();
        _isRefreshing = false;
        setProducts(items: prods, category: category);
        return RefreshStatus.loaded;
      } else {
        _isRefreshing = false;
        thisRef.isComplete = true;
        return RefreshStatus.noMoreProductsToShow;
      }
    } catch (e) {
      print(e);
      _isRefreshing = false;
      return RefreshStatus.error;
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
  error,
}

class CategoryProperties {
  EachProperty _top = EachProperty();
  EachProperty _bottom = EachProperty();
  EachProperty _foot = EachProperty();
  EachProperty _bags = EachProperty();
  EachProperty _watches = EachProperty();
  EachProperty _glasses = EachProperty();

  EachProperty getFromString(String category) {
    if (category.contains('Top Wear')) return _top;
    if (category.contains('Bottom Wear')) return _bottom;
    if (category.contains('Foot Wear')) return _foot;
    if (category.contains('Bags')) return _bags;
    if (category.contains('Watches')) return _watches;
    if (category.contains('Sunglasses')) return _glasses;
    return null;
  }
}

class EachProperty {
  int page;
  bool isComplete;
  EachProperty({this.page = 1, this.isComplete = false});
}
