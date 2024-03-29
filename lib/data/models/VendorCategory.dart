import 'package:json_annotation/json_annotation.dart';

import 'server_image.dart';

part 'VendorCategory.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class VendorCategory {
  final int id;
  final String descriptionCategory;
  @JsonKey(nullable: true)
  final ServerImage image;

  VendorCategory(this.id, this.descriptionCategory, this.image);

  factory VendorCategory.fromJson(Map<String, dynamic> json) => _$VendorCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$VendorCategoryToJson(this);
}
