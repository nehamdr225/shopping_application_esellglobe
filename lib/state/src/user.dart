import 'package:esell/core/SecureStorage.dart';
import 'package:esell/core/validators.dart';
import 'package:esell/entities/user.api.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  final UserApi _api;
  final Validator _validator;
  final CoreSecureStorage _storage;

  UserModel(this._api, this._storage, this._validator) {
    init();
  }

  Future init() async {
    final token = await _storage.getValue('token');
    if (token != null) {
      _token = token;
      final result = await _api.getUser(token);
      if (result['error'] == null) {
        if (result['message'] == "Auth failed") {
          _storage.delKeyVal("token");
          _token = null;
          notifyListeners();
        } else if (result['result']['cart'] != null) {
          final data = await _api.getCart(token);
          if (data['error'] == null) _cart = data['result']['products'];
          notifyListeners();
        }
        user = result['result'];
        notifyListeners();
      }
    }
  }

  String _token;
  Map _user;
  List<String> _wishList = [];
  List _cart = [];

  Validator get validator => _validator;
  UserApi get api => _api;
  String get token => _token;
  set token(String token) {
    if (token != _token) {
      _token = token;
      notifyListeners();
    }
  }

  Map get user => _user;
  set user(Map user) {
    if (user != null) {
      _user = user;
      notifyListeners();
    }
  }

  get cart => _cart;
  set cart(items) => _cart = items;
  addToCart(String product, qty, size, color) {
    if (!_cart.contains(product)) {
      if (user['cart'] == null) {
        _api.registerCart(token, product, qty ?? 1, size, color).then((data) {
          if (data['error'] == null) {
            _cart.add(product);
            _user.addAll({'cart': data['result']['_id']});
            notifyListeners();
            return "success";
          }
          return "failed";
        });
      } else
        _api
            .updateCart(token, product, qty ?? 1, size ?? "S", color ?? "Black")
            .then((result) {
          if (result['error'] == null) {
            _cart.add({
              'product': product,
              'quantity': qty ?? 1,
              'size': size,
              'color': color
            });
            notifyListeners();
            return "success";
          }
          return "failed";
        });
    }
  }

  findCartItem(id) {
    return _cart.contains(id);
  }

  deleteFromCart(id) {
    _api.deleteCartItem(token, id).then((data) {
      print(data);
      if (data['error'] == null) {
        _cart.removeWhere((each) => each['product'] == id);
        notifyListeners();
        return "done";
      }
      return "failed";
    });
  }

  get wishList => _wishList;
  addToWishList(String product) {
    _wishList.add(product);
    notifyListeners();
  }

  findWishlistItem(id) {
    if (_wishList.length == 0) return false;
    return _wishList.contains(id);
  }

  placeOrder(body) async {
    return await _api.createOrder(token, body);
  }

  logout() async {
    token = null;
    user = {};
    _storage.delKeyVal("token");
  }
}
