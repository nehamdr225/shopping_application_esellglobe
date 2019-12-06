import 'package:esell/helpers/Api.dart';
import 'package:flutter/cupertino.dart';

class ProductModel extends ChangeNotifier {
  ProductModel() {
    getProducts(page: page).then((data) {
      if (data['error'] == null) {
        products = data['products'];
        maxCount = data['count'];
      } else
        print(data['error']);
    });
  }
  List _products = [];
  // Map _productsStore = {
  //   "men": {
  //     "top": {"casual": [], "formal": [], "t-shirt": [], "jacket": []},
  //     "bottom": {"jeans": [], "formal": [], "sports": []},
  //     "shoe": {"casual": [], "formal": [], "sports": [], "slipper": []},
  //     "bags": [],
  //     "glasses": [],
  //     "watches": []
  //   },
  //   "women": {}
  // };

  // getStore(List tree) {
  //   int flag = 2;
  //   final int length = tree.length;
  //   recurse(value) {
  //     if (flag >= length) {
  //       return value;
  //     } else {
  //       final retval = value[tree[flag]];
  //       flag++;
  //       return recurse(retval);
  //     }
  //   }

  //   return recurse(_productsStore[tree[0]][tree[1]]);
  // }

  // setStore(List data) {
  //   data.forEach((point) {
  //     final String pCategory = point["category"];
  //     if (pCategory.contains("men") && pCategory.contains("top")) {
  //       if (pCategory.contains("casual"))
  //         _productsStore["men"]["top"]["casual"].add(point);
  //       else if (pCategory.contains("formal"))
  //         _productsStore["men"]["top"]["formal"].add(point);
  //       else if (pCategory.contains("t-shirt"))
  //         _productsStore["men"]["top"]["t-shirt"].add(point);
  //       else if (pCategory.contains("jacket"))
  //         _productsStore["men"]["top"]["jacket"].add(point);
  //     } else if (pCategory.contains("men") && pCategory.contains("bottom")) {
  //       if (pCategory.contains("jeans"))
  //         _productsStore["men"]["bottom"]["jeans"].add(point);
  //       else if (pCategory.contains("formal"))
  //         _productsStore["men"]["bottom"]["formal"].add(point);
  //       else if (pCategory.contains("sports"))
  //         _productsStore["men"]["bottom"]["sports"].add(point);
  //     } else if (pCategory.contains("men") && pCategory.contains("shoe")) {
  //       if (pCategory.contains("casual"))
  //         _productsStore["men"]["shoe"]["casual"].add(point);
  //       else if (pCategory.contains("formal"))
  //         _productsStore["men"]["shoe"]["formal"].add(point);
  //       else if (pCategory.contains("sports"))
  //         _productsStore["men"]["shoe"]["sports"].add(point);
  //       else if (pCategory.contains("slipper"))
  //         _productsStore["men"]["shoe"]["slipper"].add(point);
  //     } else if (pCategory.contains("men") && pCategory.contains("bags")) {
  //       _productsStore["men"]["bags"].add(point);
  //     } else if (pCategory.contains("men") && pCategory.contains("glasses")) {
  //       _productsStore["men"]["glasses"].add(point);
  //     } else if (pCategory.contains("men") && pCategory.contains("watches")) {
  //       _productsStore["men"]["watches"].add(point);
  //     }
  //   });
  // }

  int _maxCount;
  int _page = 1;
  bool _isRefreshing = false;

  get isRefreshing => _isRefreshing;
  set isRefreshing(value) {
    _isRefreshing = value;
    notifyListeners();
  }

  List get products => _products;
  get count => _products.length;
  get maxCount => _maxCount;
  set maxCount(value) {
    _maxCount = value;
    notifyListeners();
  }

  get page => _page;
  set page(value) {
    _page = value;
    notifyListeners();
  }

  one(id) {
    for (var item in _products) {
      if (item['_id'] == id) return item;
    }
    return {'error': 'Product not found!'};
  }

  category(List<String> cat) {
    return products.where((product) {
      return cat
          .every((each) => product["category"].contains(each.toLowerCase()));
      // return product["category"].contains(cat.toLowerCase());
    }).toList();
  }

  set product(Map item) {
    if (products.firstWhere((each) => each['_id'] == item['_id']).length == 0)
      _products.add(item);
    notifyListeners();
  }

  set products(List items) {
    if (_products.length > 0) {
      items.forEach((el) {
        final check = _products.any((product) => product['_id'] == el['_id']);
        if (!check) _products.add(el);
      });
    } else {
      _products = items;
    }
    notifyListeners();
  }

  refresh() async {
    try {
      if (maxCount != null && page * 15 < maxCount) {
        final res = await getProducts(page: page + 1);
        if (res['products'].length > 0) {
          page = page + 1;
          products = res['products'];
          return "success";
        }
        return "done";
      }
      return "done";
    } catch (e) {
      print(e);
      isRefreshing = false;
      return "done";
    }
  }
}
