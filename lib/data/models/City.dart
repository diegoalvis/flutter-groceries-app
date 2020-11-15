import 'package:json_annotation/json_annotation.dart';

part 'City.g.dart';

@JsonSerializable(nullable: false)
class City {
  final String name;
  final String cityCode;
  final String countryCode;

  City(this.name, this.cityCode, this.countryCode);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
