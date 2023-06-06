// To parse this JSON data, do
//
//     final allProductsResponse = allProductsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'all_products.g.dart';


List<AllProducts> allProductsResponseFromJson(String str) => List<AllProducts>.from(json.decode(str).map((x) => AllProducts.fromJson(x)));

String allProductsResponseToJson(List<AllProducts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
@JsonSerializable()
class AllProducts {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  AllProducts({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating?.toJson(),
  };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
