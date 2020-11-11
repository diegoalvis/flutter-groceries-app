import 'package:json_annotation/json_annotation.dart';
import 'package:winkels_customer/data/models/server_image.dart';

part 'Address.g.dart';

@JsonSerializable(nullable: false)
class Address {
  final String address;
  @JsonKey(nullable: true)
  final String additional;
  final String cityCode;
  final String countryCode;

  Address(this.countryCode, this.address, this.additional, this.cityCode);

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
