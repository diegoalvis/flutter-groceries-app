import 'package:json_annotation/json_annotation.dart';

part 'OrderProduct.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class OrderProduct {
  String name;
  String description;
  int quantity;
  double unitPrice;

  OrderProduct({this.name, this.description, this.quantity, this.unitPrice});

  factory OrderProduct.fromJson(Map<String, dynamic> json) => _$OrderProductFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductToJson(this);
}
