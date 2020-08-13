import 'package:esell/core/SecureStorage.dart';
import 'package:esell/core/fetch.dart';

class UserApi {
  final Fetch _fetch;
  final CoreSecureStorage _storage;
  final String url = "https://api.shop2more.com";

  UserApi(this._fetch, this._storage);

  //token & id --> success
  //otp & id -->  not verified
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
    if (response['token'] != null && remember)
      _storage.savekeyVal('token', response['token']);
    return response;
  }

  //error, message & id
  signup(String email, String password, String name, String contact) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final response = await _fetch.post(
        url: '$url/user/signup',
        body: {
          'email': email,
          'password': password,
          'name': name,
          'contact': contact,
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
        url: "$url/cart/$id/$qty/$size/$color",
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
        url: "$url/cart/$productId/$qty/$size/$color",
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
        url: "$url/orders",
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

  getProductRatings({
    int page = 1,
    int result = 15,
    String productId,
    String token,
  }) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.get(
        url: "$url/rating/product/$productId?page=$page&result=$result",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  getSpecificProductRating(String ratingId, String token) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.get(
        url: "$url/rating/$ratingId",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  rateProduct(token, productId, rate) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response =
          await _fetch.post(url: "$url/rating/", headers: headers, body: {
        'rating': rate,
        'product': productId,
      });
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  updateRating(token, productId, rate) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch
          .put(url: "$url/rating/$productId", headers: headers, body: {
        'rating': rate,
      });
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  reviewProduct(token, productId, review) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response =
          await _fetch.post(url: "$url/reviews/", headers: headers, body: {
        'review': review,
        'product': productId,
      });
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  updateReview(token, productId, review) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch
          .put(url: "$url/reviews/$productId", headers: headers, body: {
        'review': review,
      });
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  getProductReviews({
    int page = 1,
    int result = 15,
    String productId,
    String token,
  }) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.get(
        url: "$url/reviews/product/$productId?page=$page&result=$result",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  getSpecificProductReview(String reviewId, String token) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.get(
        url: "$url/reviews/$reviewId",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteReview(String reviewId, String token) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-Access-Token": token
      };
      final response = await _fetch.delete(
        url: "$url/reviews/$reviewId",
        headers: headers,
      );
      return response;
    } catch (err) {
      return {"error": err};
    }
  }
}
