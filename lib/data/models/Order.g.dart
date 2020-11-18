// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    deliveryAddress: json['delivery_address'] as String,
    orderTotal: (json['order_total'] as num).toDouble(),
    deliveryFee: (json['delivery_fee'] as num).toDouble(),
    orderStatus: json['order_status'] as String,
    vendor: Vendor.fromJson(json['vendor'] as Map<String, dynamic>),
    itemsTotal: (json['items_total'] as num).toDouble(),
    payment: json['payment'] == null
        ? null
        : OrderPayment.fromJson(json['payment'] as Map<String, dynamic>),
    products: (json['products'] as List)
        .map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
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
