import 'dart:convert';

import 'atrocity_model.dart';



List<Shirt> shirtsFromJson(String str) => List<Shirt>.from(json.decode(str).map((x) => Shirt.fromJson(x)));

String shirtsToJson(List<Shirt> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shirt {
  Shirt({
    required this.id,
    required this.name,
    required this.price,
    required this.country,
    required this.shirtImage,
    required this.atrocity,
    required this.slug,
    required this.originalImage
  });

  int id;
  String name;
  double price;
  String country;
  String shirtImage;
  List<Atrocity> atrocity;
  String slug;
  String originalImage;

  factory Shirt.fromJson(Map<String, dynamic> json) => Shirt(
    id: json["id"],
    name: json["name"],
    originalImage: json['original_image'],
    price: json["price"].toDouble(),
    country: json["country"],
    shirtImage: json["shirt_image"],
    atrocity: List<Atrocity>.from(json["Atrocity"].map((x) => Atrocity.fromJson(x))),
    slug: json["slug"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "country": country,
    "shirt_image": shirtImage,
    "Atrocity": List<dynamic>.from(atrocity.map((x) => x.toJson())),
    "slug": slug,
    "original_image":originalImage,
  };
}