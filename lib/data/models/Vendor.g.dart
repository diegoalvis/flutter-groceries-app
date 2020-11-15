// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return Vendor(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    json['logo'] == null
        ? null
        : ServerImage.fromJson(json['logo'] as Map<String, dynamic>),
    json['location'] == null
        ? null
        : Address.fromJson(json['location'] as Map<String, dynamic>),
    json['hoursOfOperation'] == null
        ? null
        : Schedule.fromJson(json['hoursOfOperation'] as Map<String, dynamic>),
    (json['vendorCategories'] as List)
        ?.map((e) => e == null
            ? null
            : VendorCategory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VendorToJson(Vendor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'logo': instance.logo,
      'location': instance.location,
      'hoursOfOperation': instance.hoursOfOperation,
      'vendorCategories': instance.vendorCategories,
    };
