import 'package:json_annotation/json_annotation.dart';

import 'category_model.dart';
import 'country_model.dart';

part 'atrocity_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Atrocity {
  Atrocity(
      {required this.id,
      required this.title,
      required this.region,
      required this.info,
      required this.imageUrl,
      required this.category,
      required this.country,
      required this.slug,
      required this.videoURL});

  String title;
  String region;
  String info;
  @JsonKey(name: 'image_url')
  String imageUrl;
  List<Category> category;
  Country country;
  String slug;
  String videoURL;
  int id;

  factory Atrocity.fromJson(Map<String, dynamic> data) =>
      _$AtrocityFromJson(data);

  Map<String, dynamic> toJson() => _$AtrocityToJson(this);
}
