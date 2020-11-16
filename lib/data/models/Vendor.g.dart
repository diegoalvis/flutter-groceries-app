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
    json['hours_of_operation'] == null
        ? null
        : Schedule.fromJson(json['hours_of_operation'] as Map<String, dynamic>),
    (json['vendor_category'] as List)
        ?.map((e) => e == null
            ? null
            : VendorCategory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['delivery_fee'] as num).toDouble(),
  );
}

Map<String, dynamic> _$VendorToJson(Vendor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'delivery_fee': instance.deliveryFee,
      'logo': instance.logo,
      'location': instance.location,
      'hours_of_operation': instance.hoursOfOperation,
      'vendor_category': instance.vendorCategory,
    };
