import 'package:json_annotation/json_annotation.dart';

import 'server_image.dart';

part 'VendorCategory.g.dart';

@JsonSerializable(nullable: false)
class VendorCategory {
  final int id;
  final String descriptionCategory;
  final List<String> vendors;
  @JsonKey(nullable: true)
  final ServerImage image;

  VendorCategory(this.id, this.descriptionCategory, this.vendors, this.image);

  factory VendorCategory.fromJson(Map<String, dynamic> json) => _$VendorCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$VendorCategoryToJson(this);
}
