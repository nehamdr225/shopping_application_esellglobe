import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  List<Map> _cart = [];

  get cart => _cart;
  get count => _cart.length;

  set cart(List<Map> products) {
    _cart.addAll(products);
    notifyListeners();
  }

  one(product) {
    _cart.add(product);
    notifyListeners();
  }
}
