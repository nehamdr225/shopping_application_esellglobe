import 'package:esell/core/SecureStorage.dart';
import 'package:esell/core/fetch.dart';

class UserApi {
  final Fetch _fetch;
  final CoreSecureStorage _storage;
  final String url = "https://apiesell.herokuapp.com";

  UserApi(this._fetch, this._storage);

  logout() async {
    try {
      await _storage.delKeyVal("token");
      return "success";
    } catch (err) {
      return "failed";
    }
  }

  login(String email, String password, bool remember) async {
    try {
      final response = await _fetch.post(url: '$url/user/login', body: {
        'email': email,
        'password': password,
      }, headers: {
        "Content-Type": "application/json"
      });
      if (response['error'] != null) {
        return {"error": response['error']};
      }
      if (remember) _storage.savekeyVal('token', response['token']);
      return {"token": response['token']};
    } catch (err) {
      return {"error": err};
    }
  }

  signup(String email, String password, String name) async {
    try {
      final response = await _fetch.post(url: '$url/user/signup', body: {
        'email': email,
        'password': password,
        'name': name,
      }, headers: {
        "Content-Type": "application/json",
      });
      return response;
    } catch (err) {
      return {'error': err};
    }
  }

  getUser(token) async {
    try {
      final response = await _fetch.get(url: "$url/user", headers: {
        "Content-Type": "application/json",
        "X-Access-Token": token
      });
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  getCart(token) async {
    try {
      final response = await _fetch
          .get(url: "$url/cart", headers: {"X-Access-Token": token});
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  registerCart(token, id, qty, size, color) async {
    try {
      final response = await _fetch.post(
        url: "$url/cart/$id?quantity=$qty&size=$size&color=$color",
        headers: {"X-Access-Token": token},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  updateCart(token, productId, qty, size, color) async {
    try {
      final response = await _fetch.put(
        url: "$url/cart/$productId?quantity=$qty&size=$size&color=$color",
        headers: {"X-Access-Token": token},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteCartItem(token, id) async {
    try {
      final response = await _fetch.delete(
        url: "$url/cart/$id",
        headers: {"X-Access-Token": token},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  emptyCartItems(token) async {
    try {
      final response = await _fetch.delete(
        url: "$url/cart/empty",
        headers: {"X-Access-Token": token},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  getOrders(token) async {
    try {
      final response = await _fetch.get(
        url: "$url/orders/",
        headers: {"X-Access-Token": token},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  createOrder(token) async {
    try {
      final response = await _fetch.post(
        url: "$url/orders/",
        headers: {"X-Access-Token": token},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  updateOrder(token, productId, status) async {
    try {
      final response = await _fetch.put(
          url: "$url/orders/$productId",
          headers: {"X-Access-Token": token},
          body: {'status': status});
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteOrder(token, id) async {
    try {
      final response = await _fetch.delete(
        url: "$url/orders/$id",
        headers: {"X-Access-Token": token},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  getWishList(token) async {
    try {
      final response = await _fetch.get(
        url: "$url/wishlist",
        headers: {"X-Access-Token": token},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  createWishList(token, products) async {
    try {
      final response = await _fetch.post(
        url: "$url/wishlist/",
        headers: {"X-Access-Token": token},
        body: {'products': products},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  updateWishList(token, productId) async {
    try {
      final response = await _fetch.put(
        url: "$url/wishlist/$productId",
        headers: {"X-Access-Token": token},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteWishListItem(token, id) async {
    try {
      final response = await _fetch.delete(
        url: "$url/wishlist/$id",
        headers: {"X-Access-Token": token},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }
}
