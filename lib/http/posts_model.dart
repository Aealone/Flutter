import 'package:flutter/foundation.dart';

class Post {
  final List sizes;
  // final gallery;
  final String category;
  final String brand;
  final String color;
  final int oldPrice;
  final int newPrice;
  final String mainLink;


  Post({
    @required this.sizes,
    // @required this.gallery,
    @required this.category,
    @required this.brand,
    @required this.color,
    @required this.oldPrice,
    @required this.newPrice,
    @required this.mainLink,
  
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      sizes: json['sizes'] as List,
      // gallery: json['gallery'],
      category: json['category'] as String,
      brand: json['brand'] as String,
      color: json['color'] as String,
      oldPrice: json['oldPrice'] as int,
      newPrice: json['newPrice'] as int,
      mainLink: json['mainLink'] as String,
    );
  }
}