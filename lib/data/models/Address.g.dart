// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['countryCode'] as String,
    json['address'] as String,
    json['additional'] as String,
    json['cityCode'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address': instance.address,
      'additional': instance.additional,
      'cityCode': instance.cityCode,
      'countryCode': instance.countryCode,
    };
