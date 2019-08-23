import './Fetch.dart';
import '../store/Store.dart';

final String url = "https://apiesell.herokuapp.com";
String method = "GET";

login(String email, String password) async {
  try {
    var response = await fetch(uri: '$url/user/login', method: "POST", body: {
      'email': email,
      'password': password,
    });
    if (response['token'] != null) {
      savekeyVal('token', response['token']);
      return {"token": response['token']};
    }
    return {"error": "Email or password is not valid!"};
  } catch (err) {
    return {"error": err};
  }
}

signup(String email, String password, String name) async {
  try {
    var response = await fetch(uri: '$url/user/signup', method: "POST", body: {
      'email': email,
      'password': password,
      'name': name,
    });

    return response.message;
  } catch (err) {
    return err;
  }
}

getProducts({result = 10, page = 1}) async {
  try {
    var response = await fetch(uri: '$url/products?result=$result&page=$page');
    return response['products'];
  } catch (err) {
    return err;
  }
}

getProductsByCategory({category = "top", result = 10, page = 1}) async {
  fetch(uri: '$url/products/category/$category?result=$result&page=$page')
      .then((response) {
    return response.products;
  });
}

getUser(id) async {
  try {
    var response = await fetch(uri: "$url/user");
    return response.result;
  } catch (err) {
    return err;
  }
}
