import './Fetch.dart';
import '../state/state.dart';

final String url = "https://apiesell.herokuapp.com";
String method = "GET";

logout() async {
  try {
    await delKeyVal("token");
    return "success";
  } catch (err) {
    return "failed";
  }
}

login(String email, String password, bool remember) async {
  try {
    final response = await fetch(uri: '$url/user/login', method: "POST", body: {
      'email': email,
      'password': password,
    }, headers: {
      "Content-Type": "application/json"
    });
    if (response['error'] != null) {
      return {"error": response['error']};
    }
    if (remember) savekeyVal('token', response['token']);
    return {"token": response['token']};
  } catch (err) {
    return {"error": err};
  }
}

signup(String email, String password, String name) async {
  try {
    final response =
        await fetch(uri: '$url/user/signup', method: "POST", body: {
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

getProducts({result = 15, page = 1}) async {
  try {
    final response = await fetch(
      uri: '$url/products/$page?result=15',
    );
    return response;
  } catch (err) {
    return {"error": err};
  }
}

getProductsByCategory({category = "top", result = 10, page = 1}) async {
  fetch(
    uri: '$url/products/category/$category?result=$result&page=$page',
  ).then((response) {
    return response;
  });
}

getUser(token) async {
  try {
    final response = await fetch(
        uri: "$url/user",
        headers: {"Content-Type": "application/json", "X-Access-Token": token});
    return response;
  } catch (err) {
    return {"error": err};
  }
}

getCart(token) async {
  try {
    final response =
        await fetch(uri: "$url/cart", headers: {"X-Access-Token": token});
    return response;
  } catch (err) {
    return {"error": err};
  }
}

registerCart(token, id, qty, size, color) async {
  try {
    final response = await fetch(
        uri: "$url/cart/$id?quantity=$qty&size=$size&color=$color",
        headers: {"X-Access-Token": token},
        method: "POST");
    return response;
  } catch (err) {
    return {"error": err};
  }
}

updateCart(token, productId, qty, size, color) async {
  try {
    final response = await fetch(
        uri: "$url/cart/$productId?quantity=$qty&size=$size&color=$color",
        headers: {"X-Access-Token": token},
        method: "PUT");
    return response;
  } catch (err) {
    return {"error": err};
  }
}

deleteCartItem(token, id) async {
  try {
    final response = await fetch(
        uri: "$url/cart/$id",
        headers: {"X-Access-Token": token},
        method: "DELETE");
    return response;
  } catch (err) {
    return {"error": err};
  }
}

emptyCartItems(token) async {
  try {
    final response = await fetch(
        uri: "$url/cart/empty",
        headers: {"X-Access-Token": token},
        method: "DELETE");
    return response;
  } catch (err) {
    return {"error": err};
  }
}

getOrders(token) async {
  try {
    final response = await fetch(
      uri: "$url/orders/",
      headers: {"X-Access-Token": token},
    );
    return response;
  } catch (err) {
    return {"error": err};
  }
}

createOrder(token, id) async {
  try {
    final response = await fetch(
        uri: "$url/orders/$id",
        headers: {"X-Access-Token": token},
        method: "POST");
    return response;
  } catch (err) {
    return {"error": err};
  }
}

updateOrder(token, productId, status) async {
  try {
    final response = await fetch(
        uri: "$url/orders/$productId",
        headers: {"X-Access-Token": token},
        method: "PUT",
        body: {'status': status});
    return response;
  } catch (err) {
    return {"error": err};
  }
}

deleteOrder(token, id) async {
  try {
    final response = await fetch(
        uri: "$url/orders/$id",
        headers: {"X-Access-Token": token},
        method: "DELETE");
    return response;
  } catch (err) {
    return {"error": err};
  }
}

getWishList(token) async {
  try {
    final response = await fetch(
      uri: "$url/wishlist",
      headers: {"X-Access-Token": token},
    );
    return response;
  } catch (err) {
    return {"error": err};
  }
}

createWishList(token, products) async {
  try {
    final response = await fetch(
        uri: "$url/wishlist/",
        headers: {"X-Access-Token": token},
        method: "POST",
        body: {'products': products});
    return response;
  } catch (err) {
    return {"error": err};
  }
}

updateWishList(token, productId) async {
  try {
    final response = await fetch(
      uri: "$url/wishlist/$productId",
      headers: {"X-Access-Token": token},
      method: "PUT",
    );
    return response;
  } catch (err) {
    return {"error": err};
  }
}

deleteWishListItem(token, id) async {
  try {
    final response = await fetch(
        uri: "$url/wishlist/$id",
        headers: {"X-Access-Token": token},
        method: "DELETE");
    return response;
  } catch (err) {
    return {"error": err};
  }
}
