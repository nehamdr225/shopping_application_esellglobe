import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  List<String> _cart = [];

  get cart => _cart;
  set cart(List<String> product) {
    _cart.addAll(product);
    notifyListeners();
  }
}
