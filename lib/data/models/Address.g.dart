// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    countryCode: json['countryCode'] as String,
    address: json['address'] as String,
    additional: json['additional'] as String,
    cityCode: json['cityCode'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address': instance.address,
      'additional': instance.additional,
      'cityCode': instance.cityCode,
      'countryCode': instance.countryCode,
    };
