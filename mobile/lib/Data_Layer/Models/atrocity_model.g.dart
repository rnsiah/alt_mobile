// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atrocity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Atrocity _$AtrocityFromJson(Map<String, dynamic> json) {
  return Atrocity(
    id: json['id'] as int,
    title: json['title'] as String,
    region: json['region'] as String,
    info: json['info'] as String,
    imageUrl: json['image_url'] as String,
    category: (json['category'] as List<dynamic>)
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
    country: Country.fromJson(json['country'] as Map<String, dynamic>),
    slug: json['slug'] as String,
    videoURL: json['videoURL'] as String,
  );
}

Map<String, dynamic> _$AtrocityToJson(Atrocity instance) => <String, dynamic>{
      'title': instance.title,
      'region': instance.region,
      'info': instance.info,
      'image_url': instance.imageUrl,
      'category': instance.category.map((e) => e.toJson()).toList(),
      'country': instance.country.toJson(),
      'slug': instance.slug,
      'videoURL': instance.videoURL,
      'id': instance.id,
    };
