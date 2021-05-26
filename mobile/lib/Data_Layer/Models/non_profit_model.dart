
import 'dart:convert';

import 'atrocity_model.dart';
import 'category_model.dart';
import 'shirt_model.dart';


List<NonProfit> emptyFromJson(String str) => List<NonProfit>.from(json.decode(str).map((x) => NonProfit.fromJson(x)));

String nonProfitToJson(List<NonProfit> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NonProfit {
  NonProfit({
    required this.name,
    required this.logo,
    required this.description,
    required this.yearStarted,
    required this.missionStatement,
    required this.visionStatement,
    required this.websiteUrl,
    required this.category,
    required this.slug,
    required this.atrocity,
    required this.shirtList,
    required this.mainImage

  });

  String name;
  String logo;
  String description;
  int yearStarted;
  String missionStatement;
  String visionStatement;
  String websiteUrl;
  List<Category> category;
  String slug;
  List<Atrocity> atrocity;
  List<Shirt>shirtList;
  String mainImage;

  factory NonProfit.fromJson(Map<String, dynamic> json) => NonProfit(
    name: json["name"],
    logo: json["logo"],
    description: json["description"],
    yearStarted: json["year_started"],
    missionStatement: json["mission_statement"],
    visionStatement: json["vision_statement"],
    websiteUrl: json["website_url"],
    mainImage: json['main_image'],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    slug: json["slug"],
    atrocity: List<Atrocity>.from(json["atrocity"].map((x) => Atrocity.fromJson(x))),
    shirtList: List<Shirt>.from(json["shirtList"].map((x) => Shirt.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "logo": logo,
    "description": description,
    "year_started": yearStarted,
    "mission_statement": missionStatement,
    "vision_statement": visionStatement,
    "website_url": websiteUrl,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "slug": slug,
    "atrocity": List<dynamic>.from(atrocity.map((x) => x.toJson())),
    "shirtList": List<dynamic>.from(shirtList.map((x) => x.toJson())),
    "main_image":mainImage
  };
}