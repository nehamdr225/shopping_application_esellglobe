import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const API_URI = "https://apiesell.herokuapp.com/products";
List data;

class Products {
  final String name;
  final String description;
  final String seller;
  final int price;
  final String category;
  final int stock;
  final int id;
  final List media;

  Products(
      {this.name,
      this.description,
      this.category,
      this.seller,
      this.price,
      this.id,
      this.media,
      this.stock});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      //Text( data[index]["name"],)
      stock: json['products']['stock'],
      media: json['products']['media'],
      id: json['products']['id'],
      name: json['products']['name'],
      category: json['products']['category'],
      description: json['products']['description'],
      price: json['products']['price'],
      seller: json['products']['seller'],
    );
  }
}

Future<Products> fetchDB() async {
  final response = await http.get(API_URI + '/location/baneshwar', headers: {
    "Accept": "application/json",
    "X-Access-Id": null,
  }); //traffic ko satta user ni rakhna milne

  final jsonresponse = json.decode(response.body);
  data = jsonresponse["products"];

  if (response.statusCode >= 200) {
    print(response.body);
    return Products.fromJson(jsonresponse);
  } else {
    throw Exception('Failed to load data');
  }
}

class StatusAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Products>(
        future: fetchDB(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Material();
          }
          
        });
  }
}
