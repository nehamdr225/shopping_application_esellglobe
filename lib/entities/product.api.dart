import 'package:esell/core/fetch.dart';

class ProductApi {
  final Fetch _fetch;
  final String url = "https://apiesell.herokuapp.com/products";

  ProductApi(this._fetch);

  getProducts({result = 15, page = 1}) async {
    try {
      return await _fetch.get(
        url: '$url/$page?result=$result',
      );
    } catch (e) {
      return e;
    }
  }

  getProductsByCategory({category = "top", result = 15, page = 1}) async {
    try {
      return await _fetch.get(
        url: '$url/category/$category?page=$page&result=$result',
      );
    } catch (e) {
      return e;
    }
  }
}
