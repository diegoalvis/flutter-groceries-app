// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VendorCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorCategory _$VendorCategoryFromJson(Map<String, dynamic> json) {
  return VendorCategory(
    json['id'] as int,
    json['descriptionCategory'] as String,
    (json['vendors'] as List).map((e) => e as String).toList(),
    json['image'] == null
        ? null
        : ServerImage.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VendorCategoryToJson(VendorCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descriptionCategory': instance.descriptionCategory,
      'vendors': instance.vendors,
      'image': instance.image,
    };
