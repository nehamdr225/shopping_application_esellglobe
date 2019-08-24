import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  List<Map> _cart = [];
  int _count = 0;

  get cart => _cart;
  get count => _count;

  set cart(List<Map> product) {
    _cart.addAll(product);
    _count = _cart.length;
    notifyListeners();
  }
}
