// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    longitude: (json['longitude'] as num)?.toDouble(),
    latitude: (json['latitude'] as num)?.toDouble(),
    countryCode: json['country_code'] as String,
    address: json['address'] as String,
    cityName: json['city_name'] as String,
    additional: json['additional'] as String,
    cityCode: json['city_code'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address': instance.address,
      'additional': instance.additional,
      'city_name': instance.cityName,
      'city_code': instance.cityCode,
      'country_code': instance.countryCode,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
