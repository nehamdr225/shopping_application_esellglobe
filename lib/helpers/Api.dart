import './Fetch.dart';

class Client {
  final String url = "https://apiesell.herokuapp.com";
  String method = "GET";

  login(String email, String password) async {
    try {
      var response = await fetch(uri: '$url/user/login', method: "POST", body: {
        'email': email,
        'password': password,
      });

      return response.token;
    } catch (err) {
      return err;
    }
  }

  signup(String email, String password, String name) async {
    try {
      var response =
          await fetch(uri: '$url/user/signup', method: "POST", body: {
        'email': email,
        'password': password,
        'name': name,
      });

      return response.message;
    } catch (err) {
      return err;
    }
  }

  getProducts({result= 10, page= 1}) async {
    try {
      var response =
          await fetch(uri: '$url/products?result=$result&page=$page');
      return response.products;
    } catch (err) {
      return err;
    }
  }

  getProductsByCategory({category="top",result= 10, page= 1}) async{
    try {
      var response =
          await fetch(uri: '$url/products/category/$category?result=$result&page=$page');
      return response.products;
    } catch (err) {
      return err;
    }
  }

  getUser(id) async {
    try {
      var response = await fetch(uri: "$url/user");
      return response.result;
    } catch (err) {
      return err;
    }
  }
}
