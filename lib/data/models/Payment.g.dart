// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) {
  return OrderPayment(
    paymentId: json['payment_id'] as String,
    paymentType: json['payment_type'] as String,
    paymentMethod: json['payment_method'] as String,
    status: json['status'] as String,
    totalAmount: (json['total_amount'] as num).toDouble(),
    couponAmount: (json['coupon_amount'] as num).toDouble(),
  );
}

Map<String, dynamic> _$OrderPaymentToJson(OrderPayment instance) =>
    <String, dynamic>{
      'payment_id': instance.paymentId,
      'payment_type': instance.paymentType,
      'payment_method': instance.paymentMethod,
      'status': instance.status,
      'total_amount': instance.totalAmount,
      'coupon_amount': instance.couponAmount,
    };
