// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) {
  return OrderProduct(
    name: json['name'] as String,
    description: json['description'] as String,
    quantity: json['quantity'] as int,
    unitPrice: (json['unit_price'] as num).toDouble(),
  );
}

Map<String, dynamic> _$OrderProductToJson(OrderProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
    };
