import 'package:esell/core/SecureStorage.dart';
import 'package:esell/core/fetch.dart';

class UserApi {
  final Fetch _fetch;
  final CoreSecureStorage _storage;
  final String url = "https://apiesell.herokuapp.com";

  UserApi(this._fetch, this._storage);

  login(String email, String password, bool remember) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final response = await _fetch.post(
      url: '$url/user/login',
      body: {
        'email': email,
        'password': password,
      },
      headers: headers,
    );
    if (response['error'] != null) {
      return {"error": response['error']};
    }
    if (remember) _storage.savekeyVal('token', response['token']);
    return {"token": response['token']};
  }

  signup(String email, String password, String name) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final response = await _fetch.post(
        url: '$url/user/signup',
        body: {
          'email': email,
          'password': password,
          'name': name,
        },
        headers: headers);
    return response;
  }

  //response.message or response.error
  reset(String id, String password, token) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final response = await _fetch.post(
      url: "$url/user/reset/$id",
      headers: headers,
      body: {'password': password, 'token': token},
    );
    return response;
  }

  //response.message or response.error
  sendOtp(String id) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final response = await _fetch.get(
      url: "$url/user/otp/$id",
      headers: headers,
    );
    return response;
  }

//response.message or response.error
  verifyOtp(String id, String token) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final response = await _fetch.get(
      url: "$url/user/verify/$id/$token",
      headers: headers,
    );
    return response;
  }

  getUser(String token) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Access-Token": token
    };
    final response = await _fetch.get(url: "$url/user", headers: headers);
    return response;
  }

  getCart(token) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Access-Token": token
    };
    try {
      final response = await _fetch.get(url: "$url/cart", headers: headers);
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  registerCart(token, id, qty, size, color) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Access-Token": token
    };
    try {
      final response = await _fetch.post(
        url: "$url/cart/$id?quantity=$qty&size=$size&color=$color",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  updateCart(token, productId, qty, size, color) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.put(
        url: "$url/cart/$productId?quantity=$qty&size=$size&color=$color",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteCartItem(token, id) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Access-Token": token
    };
    try {
      final response = await _fetch.delete(
        url: "$url/cart/$id",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  emptyCartItems(token) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.delete(
        url: "$url/cart/empty",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  getOrders(token) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.get(
        url: "$url/orders/",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  createOrder(token, body) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Access-Token": token
    };
    return await _fetch.post(url: "$url/orders/", headers: headers, body: body);
  }

  updateOrder(token, productId, status) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.put(
          url: "$url/orders/$productId",
          headers: headers,
          body: {'status': status});
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteOrder(token, id) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.delete(
        url: "$url/orders/$id",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  getWishList(token) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.get(
        url: "$url/wishlist",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  createWishList(token, products) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.post(
        url: "$url/wishlist/",
        headers: headers,
        body: {'products': products},
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  updateWishList(token, productId) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.put(
        url: "$url/wishlist/$productId",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteWishListItem(token, id) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.delete(
        url: "$url/wishlist/$id",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }
}
