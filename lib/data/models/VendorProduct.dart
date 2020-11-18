import 'package:json_annotation/json_annotation.dart';
import 'package:winkels_customer/data/models/BaseProduct.dart';
import 'package:winkels_customer/data/models/server_image.dart';

part 'VendorProduct.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class VendorProduct {
  final int id;
  final double price;
  final bool available;
  @JsonKey(nullable: true)
  final BaseProduct product;

  VendorProduct(this.id, this.price, this.available, this.product);

  factory VendorProduct.fromJson(Map<String, dynamic> json) => _$VendorProductFromJson(json);

  Map<String, dynamic> toJson() => _$VendorProductToJson(this);
}