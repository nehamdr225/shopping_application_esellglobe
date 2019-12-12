class User {
  String name, email;
  String cart;
  List<String> orders, wishlist;
  User({this.name, this.email, this.cart, this.orders, this.wishlist});

  User.fromJson(jsonData) {
    this.name = jsonData['name'];
    this.email = jsonData['email'];
    this.orders = jsonData['orders'];
    this.wishlist = jsonData['wishlist'];
    this.cart = jsonData['cart'];
  }
}
