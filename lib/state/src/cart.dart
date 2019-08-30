import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  List<String> _cart = [];

  get cart => _cart;
  get count => _cart.length;

  set cart(List<String> ids) {
    _cart.addAll(ids);
    notifyListeners();
  }

  find(id){
    return _cart.contains(id);
  }

  one(product) {
    _cart.add(product);
    notifyListeners();
  }
}
