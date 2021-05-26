

import 'category_model.dart';
import 'country_model.dart';

class Atrocity {
  Atrocity({
    required this.title,
    required this.region,
    required this.info,
    required this.imageUrl,
    required this.category,
    required this.country,
    required this.slug,
    required this.videoURL
  });

  String title;
  String region;
  String info;
  String imageUrl;
  List<Category> category;
  Country country;
  String slug;
  String videoURL;

  factory Atrocity.fromJson(Map<String, dynamic> json) => Atrocity(
    title: json["title"],
    region: json["region"],
    info: json["info"],
    imageUrl: json["image_url"],
    videoURL: json['videoURL'],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    country: Country.fromJson(json["country"]),
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "region": region,
    "info": info,
    "image_url": imageUrl,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "country": country.toJson(),
    "slug": slug,
    'videoURL':videoURL
  };
}