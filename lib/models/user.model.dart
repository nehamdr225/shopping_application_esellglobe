import 'package:flutter/material.dart';

abstract class UserModel {
  final String name, email, cart, id;
  List<String> orders, wishlist;

  UserModel({
    @required this.id,
    @required this.name,
    this.email,
    this.cart,
    this.orders,
    this.wishlist,
  });
}
