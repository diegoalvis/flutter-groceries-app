import 'package:json_annotation/json_annotation.dart';
import 'package:winkels_customer/data/models/server_image.dart';

part 'base_product.g.dart';

@JsonSerializable(nullable: false)
class BaseProduct {
  final int id;
  final String name;
  final String description;
  @JsonKey(nullable: true)
  final ServerImage image;

  BaseProduct(this.id, this.name, this.description, this.image);

  factory BaseProduct.fromJson(Map<String, dynamic> json) => _$BaseProductFromJson(json);

  Map<String, dynamic> toJson() => _$BaseProductToJson(this);
}
