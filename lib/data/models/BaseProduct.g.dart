// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseProduct _$BaseProductFromJson(Map<String, dynamic> json) {
  return BaseProduct(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    json['image'] == null
        ? null
        : ServerImage.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BaseProductToJson(BaseProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
