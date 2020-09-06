import 'package:esell/api/fetch.dart';
// import 'package:esell/entities/product.dart';

class ProductApi {
  final Fetch _fetch;
  // final String url = "https://apiesell.herokuapp.com/products";
  final String url = "https://api.shop2more.com/products";

  ProductApi(this._fetch);

  getProducts({result = 15, page = 1}) async {
    return (await _fetch.get(
      url: '$url/$page?result=$result',
    ))
        .data;
    // if (data['error'] != null) throw data['error'];
    // return data['products']
    //     .map<Product>((each) => Product.fromJson(each))
    //     .toList();
  }

  Future<Map> getProductsByCategory({
    category = "top",
    result = 15,
    page = 1,
  }) async {
    return (await _fetch.get(
      url: '$url/category/$category?page=$page&result=$result',
    ))
        .data;
  }

  Future<Map> getProductDetails(String productId) async {
    return (await _fetch.get(url: '$url/id/$productId')).data;
  }
}
