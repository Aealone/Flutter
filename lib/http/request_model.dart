import 'package:flutter/foundation.dart';

class ProductInfo {
  final String id;
  final List sizes;
  final List image;
  final String category;
  final String brand;
  final String color;
  final int oldPrice;
  final int newPrice;
  final String mainLink;
  
  ProductInfo({
    @required this.id,
    @required this.sizes,
    @required this.image,
    @required this.category,
    @required this.brand,
    @required this.color,
    @required this.oldPrice,
    @required this.newPrice,
    @required this.mainLink,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      id: json['_id'] as String,
      sizes: json['sizes'] as List,
      image: json['gallery'] as List,
      category: json['category'] as String,
      brand: json['brand'] as String,
      color: json['color'] as String,
      oldPrice: json['oldPrice'] as int,
      newPrice: json['newPrice'] as int,
      mainLink: json['mainLink'] as String,
    );
  }
}