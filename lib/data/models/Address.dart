import 'package:json_annotation/json_annotation.dart';

part 'Address.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Address {
  final String address;
  @JsonKey(nullable: true)
  final String additional;
  final String cityName;
  final String cityCode;
  final String countryCode;
  @JsonKey(nullable: true)
  final double longitude;
  @JsonKey(nullable: true)
  final double latitude;

  Address({this.longitude, this.latitude, this.countryCode, this.address, this.cityName, this.additional, this.cityCode});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
