// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VendorCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorCategory _$VendorCategoryFromJson(Map<String, dynamic> json) {
  return VendorCategory(
    json['id'] as int,
    json['description_category'] as String,
    json['image'] == null
        ? null
        : ServerImage.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VendorCategoryToJson(VendorCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description_category': instance.descriptionCategory,
      'image': instance.image,
    };
