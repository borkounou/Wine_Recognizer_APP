import 'dart:convert';

import 'package:wine_recognizer/models/rating.dart';

import 'package:wine_recognizer/models/comment.dart';

class Product {
  final String name;
  String? description;
  final double quantity;
  List<String>? images;
  String? country;
  final double price;
  final String? id;
  final List<Rating>? rating;
  final List<Comments>? comment;

  Product({
    required this.name,
    this.description,
    required this.quantity,
    this.images,
    this.country,
    required this.price,
    this.id,
    this.rating,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'country': country,
      'price': price,
      'id': id,
      'rating': rating,
      'comment': comment,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      country: map['country'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
      rating: map['ratings'] != null
          ? List<Rating>.from(map['ratings']?.map((x) => Rating.fromMap(x)))
          : null,
      comment: map['comments'] != null
          ? List<Comments>.from(
              map['comments']?.map((x) => Comments.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
