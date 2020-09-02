import 'package:esell/core/SecureStorage.dart';
import 'package:esell/core/validators.dart';
import 'package:esell/entities/cart.dart';
import 'package:esell/entities/orders.dart';
import 'package:esell/entities/product.dart';
import 'package:esell/entities/user.api.dart';
import 'package:esell/entities/user.dart';
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
        } else {
          user = result['result'];
          final data = await _api.getCart(token);
          if (data['error'] == null)
            cart = data['result']['products']
                .map<CartItem>((e) => CartItem.fromJson(e))
                .toList();

          // if (result['result']['orders'].length > 0) {
          final ordersNew = await _api.getOrders(token);
          if (ordersNew['error'] == null) {
            orders = ordersNew['result']
                .map<OrderItem>((e) => OrderItem.fromJson(e))
                .toList();
          }
          // }
        }
      }
    }
  }

  String _token;
  Map _user;
  List<String> _wishList = [];
  List<CartItem> _cart = [];
  List<OrderItem> _orders = [];

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

  List<CartItem> get cart => _cart;
  set cart(List<CartItem> items) {
    _cart = items;
    notifyListeners();
  }

  List<OrderItem> get orders => _orders;
  set orders(List<OrderItem> values) {
    _orders = values;
    notifyListeners();
  }

  get wishList => _wishList;

  addToCart(String product, qty, size, color, Product productData) {
    print('$product $qty $size $color }');
    final check = _cart.any((each) => each.product.id == product);
    if (!check) {
      _api.registerCart(token, product, qty, size, color).then((data) {
        print(data);
        if (data['error'] == null) {
          _cart.add(CartItem.fromJson({
            'product': productData.toJson(),
            'timestamp': DateTime.now().toIso8601String(),
            'quantity': qty ?? 1,
            'size': size,
            'color': color,
          }));
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
        _cart.removeWhere((each) => each.product.id == id);
        notifyListeners();
        return "done";
      }
      return "failed";
    });
  }

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

  Future rateProduct(String id, double rate) async {
    return await _api.rateProduct(token, id, rate);
  }

  Future updateRating(String productId, double rate) async {
    return await _api.updateRating(token, productId, rate);
  }

  Future getUserRatingForProduct(String id) async {
    final value = await _api.getUserRatingForProduct(token, id);
    print(value);
    if (value['error'] == null &&
        value['result'] != null &&
        value['result']['rating'] != null) {
      return UserRating.fromJson(value['result']);
    }
    return null;
  }

  Future<Map> login(String email, String password, bool remember) async {
    Map response = await api.login(email, password, remember);
    if (response['token'] != null) {
      token = response['token'];
      await _storage.savekeyVal('token', token);
      init();
    }
    return response;
  }

  logout() async {
    _token = null;
    _user = {};
    _cart = [];
    _storage.delKeyVal("token");
    notifyListeners();
  }
}
