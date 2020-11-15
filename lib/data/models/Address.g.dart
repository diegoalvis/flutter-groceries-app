// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    longitude: (json['longitude'] as num)?.toDouble(),
    latitude: (json['latitude'] as num)?.toDouble(),
    countryCode: json['countryCode'] as String,
    address: json['address'] as String,
    cityName: json['cityName'] as String,
    additional: json['additional'] as String,
    cityCode: json['cityCode'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address': instance.address,
      'additional': instance.additional,
      'cityName': instance.cityName,
      'cityCode': instance.cityCode,
      'countryCode': instance.countryCode,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
