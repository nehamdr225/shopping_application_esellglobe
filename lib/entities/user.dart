class User {
  String name, email, cart;
  List<String> orders, wishlist;

  User({
    this.name,
    this.email,
    this.cart,
    this.orders,
    this.wishlist,
  });

  User.fromJson(jsonData) {
    this.name = jsonData['name'];
    this.email = jsonData['email'];
    this.orders = jsonData['orders'];
    this.wishlist = jsonData['wishlist'];
    this.cart = jsonData['cart'];
  }
}

class UserRating {
  double rating;
  String id;

  UserRating();

  UserRating.fromJson(json)
      : rating = double.parse(json['rating'].toString()),
        id = json['_id'];

  toJson() => {'_id': id, 'rating': rating};
}
