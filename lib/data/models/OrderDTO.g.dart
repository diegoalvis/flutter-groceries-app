// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) {
  return OrderDTO(
    id: json['id'] as int,
    deliveryAddress: json['delivery_address'] as String,
    orderTotal: (json['order_total'] as num).toDouble(),
    deliveryFee: (json['delivery_fee'] as num).toDouble(),
    orderStatus: json['order_status'] as String,
    vendor: json['vendor'] as String,
    itemsTotal: (json['items_total'] as num).toDouble(),
    payment: OrderPayment.fromJson(json['payment'] as Map<String, dynamic>),
    products: (json['products'] as List)
        .map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrderDTOToJson(OrderDTO instance) => <String, dynamic>{
      'id': instance.id,
      'delivery_address': instance.deliveryAddress,
      'order_total': instance.orderTotal,
      'delivery_fee': instance.deliveryFee,
      'order_status': instance.orderStatus,
      'vendor': instance.vendor,
      'items_total': instance.itemsTotal,
      'payment': instance.payment,
      'products': instance.products,
    };
