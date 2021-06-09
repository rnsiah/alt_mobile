// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shirt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shirt _$ShirtFromJson(Map<String, dynamic> json) {
  return Shirt(
    id: json['id'] as int,
    name: json['name'] as String,
    price: (json['price'] as num).toDouble(),
    country: Country.fromJson(json['country'] as Map<String, dynamic>),
    shirtImage: json['shirtImage'] as String,
    atrocity: (json['atrocity'] as List<dynamic>)
        .map((e) => Atrocity.fromJson(e as Map<String, dynamic>))
        .toList(),
    slug: json['slug'] as String,
    originalImage: json['originalImage'] as String,
  );
}

Map<String, dynamic> _$ShirtToJson(Shirt instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'country': instance.country.toJson(),
      'shirtImage': instance.shirtImage,
      'atrocity': instance.atrocity.map((e) => e.toJson()).toList(),
      'slug': instance.slug,
      'originalImage': instance.originalImage,
    };
