import 'package:esell/core/SecureStorage.dart';
import 'package:esell/api/fetch.dart';

class UserApi {
  final Fetch _fetch;
  final CoreSecureStorage _storage;
  final String url = "https://api.shop2more.com";

  UserApi(this._fetch, this._storage);

  //token & id --> success
  //otp & id -->  not verified
  login(String email, String password, bool remember) async {
    final response = (await _fetch.post(
      url: '$url/user/login',
      data: {
        'email': email,
        'password': password,
      },
    ))
        .data;
    if (response['error'] != null) {
      return {"error": response['error']};
    }
    if (response['token'] != null && remember)
      _storage.savekeyVal('token', response['token']);
    return response;
  }

  //error, message & id
  signup(String email, String password, String name, String contact) async {
    final response = await _fetch.post(
      url: '$url/user/signup',
      data: {
        'email': email,
        'password': password,
        'name': name,
        'contact': contact,
      },
    );
    return response.data;
  }

  //response.message or response.error
  reset(String id, String password, token) async {
    final response = await _fetch.post(
      url: "$url/user/reset/$id",
      data: {'password': password, 'token': token},
    );
    return response.data;
  }

  //response.message or response.error
  sendOtp(String id) async {
    final response = await _fetch.get(
      url: "$url/user/otp/$id",
    );
    return response.data;
  }

//response.message or response.error
  verifyOtp(String id, String token) async {
    final response = await _fetch.get(
      url: "$url/user/verify/$id/$token",
    );
    return response.data;
  }

  getUser(String token) async {
    final response = await _fetch.get(url: "$url/user", token: token);
    return response.data;
  }

  getCart(token) async {
    try {
      final response = await _fetch.get(url: "$url/cart", token: token);
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  registerCart(token, id, qty, size, color) async {
    try {
      final response = await _fetch.post(
        url: "$url/cart/$id/$qty/$size/$color",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteCartItem(token, id) async {
    try {
      final response = await _fetch.delete(
        url: "$url/cart/$id",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  emptyCartItems(token) async {
    try {
      final response = await _fetch.delete(
        url: "$url/cart/empty",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  getOrders(token) async {
    try {
      final response = await _fetch.get(
        url: "$url/orders",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  createOrder(token, data) async {
    return (await _fetch.post(
      url: "$url/orders/",
      token: token,
      data: data,
    ))
        .data;
  }

  updateOrder(token, productId, status) async {
    try {
      final response = await _fetch.put(
          url: "$url/orders/$productId",
          token: token,
          data: {'status': status});
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteOrder(token, id) async {
    try {
      final response = await _fetch.delete(
        url: "$url/orders/$id",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  getWishList(token) async {
    try {
      final response = await _fetch.get(
        url: "$url/wishlist",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  createWishList(token, products) async {
    try {
      final response = await _fetch.post(
        url: "$url/wishlist/",
        token: token,
        data: {'products': products},
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  updateWishList(token, productId) async {
    try {
      final response = await _fetch.put(
        url: "$url/wishlist/$productId",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteWishListItem(token, id) async {
    try {
      final response = await _fetch.delete(
        url: "$url/wishlist/$id",
        token: token,
      );
      return response.data;
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
      final response = await _fetch.get(
        url: "$url/rating/product/$productId?page=$page&result=$result",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  getSpecificProductRating(String ratingId, String token) async {
    try {
      final response = await _fetch.get(
        url: "$url/rating/$ratingId",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  Future rateProduct(token, productId, rate) async {
    try {
      final response =
          await _fetch.post(url: "$url/rating/", token: token, data: {
        'rating': rate,
        'product': productId,
      });
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  Future getUserRating(token) async {
    try {
      final response = await _fetch.get(url: "$url/rating/user", token: token);
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  Future getUserRatingForProduct(token, productId) async {
    try {
      final response = await _fetch.get(
          url: "$url/rating/product/user/$productId", token: token);
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  updateRating(token, ratingId, rate) async {
    try {
      final response =
          await _fetch.put(url: "$url/rating/$ratingId", token: token, data: {
        'rating': rate,
      });
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  reviewProduct(token, productId, review) async {
    try {
      final response =
          await _fetch.post(url: "$url/reviews/", token: token, data: {
        'review': review,
        'product': productId,
      });
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  updateReview(token, productId, review) async {
    try {
      final response =
          await _fetch.put(url: "$url/reviews/$productId", token: token, data: {
        'review': review,
      });
      return response.data;
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
      final response = await _fetch.get(
        url: "$url/reviews/product/$productId?page=$page&result=$result",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  getSpecificProductReview(String reviewId, String token) async {
    try {
      final response = await _fetch.get(
        url: "$url/reviews/$reviewId",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }

  deleteReview(String reviewId, String token) async {
    try {
      final response = await _fetch.delete(
        url: "$url/reviews/$reviewId",
        token: token,
      );
      return response.data;
    } catch (err) {
      return {"error": err};
    }
  }
}
