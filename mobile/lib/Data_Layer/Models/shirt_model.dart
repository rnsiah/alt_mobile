import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/Data_Layer/Models/country_model.dart';

import 'atrocity_model.dart';
part 'shirt_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Shirt {
  Shirt(
      {required this.id,
      required this.name,
      required this.price,
      required this.country,
      required this.shirtImage,
      required this.atrocity,
      required this.slug,
      required this.originalImage});

  int id;
  String name;
  double price;
  Country country;
  String shirtImage;
  List<Atrocity> atrocity;
  String slug;
  String originalImage;

  factory Shirt.fromJson(Map<String, dynamic> data) => _$ShirtFromJson(data);

  Map<String, dynamic> toJson() => _$ShirtToJson(this);
}
