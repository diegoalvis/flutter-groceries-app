
import 'package:json_annotation/json_annotation.dart';

import 'Address.dart';
import 'Schedule.dart';
import 'VendorCategory.dart';
import 'server_image.dart';

part 'Vendor.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Vendor {
  final int id;
  final String name;
  final String description;
  final double deliveryFee;
  @JsonKey(nullable: true)
  final ServerImage logo;
  @JsonKey(nullable: true)
  final Address location;
  @JsonKey(nullable: true)
  final Schedule hoursOfOperation;
  @JsonKey(nullable: true)
  final List<VendorCategory> vendorCategory;

  Vendor(this.id, this.name, this.description, this.logo, this.location, this.hoursOfOperation, this.vendorCategory, this.deliveryFee);

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

  Map<String, dynamic> toJson() => _$VendorToJson(this);
}
