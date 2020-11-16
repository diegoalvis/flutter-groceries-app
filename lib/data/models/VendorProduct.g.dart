// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VendorProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorProduct _$VendorProductFromJson(Map<String, dynamic> json) {
  return VendorProduct(
    json['id'] as int,
    json['price'] as int,
    json['available'] as bool,
    json['product'] == null
        ? null
        : BaseProduct.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VendorProductToJson(VendorProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'available': instance.available,
      'product': instance.product,
    };
