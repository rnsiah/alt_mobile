import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'atrocity_model.dart';
import 'category_model.dart';
import 'shirt_model.dart';
part 'non_profit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NonProfit {
  NonProfit(
      {required this.name,
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
      required this.mainImage});

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
  List<Shirt> shirtList;
  String mainImage;

  factory NonProfit.fromJson(Map<String, dynamic> data) =>
      _$NonProfitFromJson(data);

  Map<String, dynamic> toJson() => _$NonProfitToJson(this);
}
