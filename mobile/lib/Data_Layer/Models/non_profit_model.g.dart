// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'non_profit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NonProfit _$NonProfitFromJson(Map<String, dynamic> json) {
  return NonProfit(
    name: json['name'] as String,
    logo: json['logo'] as String,
    description: json['description'] as String,
    yearStarted: json['yearStarted'] as int,
    missionStatement: json['missionStatement'] as String,
    visionStatement: json['visionStatement'] as String,
    websiteUrl: json['websiteUrl'] as String,
    category: (json['category'] as List<dynamic>)
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
    slug: json['slug'] as String,
    atrocity: (json['atrocity'] as List<dynamic>)
        .map((e) => Atrocity.fromJson(e as Map<String, dynamic>))
        .toList(),
    shirtList: (json['shirtList'] as List<dynamic>)
        .map((e) => Shirt.fromJson(e as Map<String, dynamic>))
        .toList(),
    mainImage: json['mainImage'] as String,
  );
}

Map<String, dynamic> _$NonProfitToJson(NonProfit instance) => <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'description': instance.description,
      'yearStarted': instance.yearStarted,
      'missionStatement': instance.missionStatement,
      'visionStatement': instance.visionStatement,
      'websiteUrl': instance.websiteUrl,
      'category': instance.category.map((e) => e.toJson()).toList(),
      'slug': instance.slug,
      'atrocity': instance.atrocity.map((e) => e.toJson()).toList(),
      'shirtList': instance.shirtList.map((e) => e.toJson()).toList(),
      'mainImage': instance.mainImage,
    };
