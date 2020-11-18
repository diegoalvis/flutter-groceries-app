import 'package:json_annotation/json_annotation.dart';
import 'package:winkels_customer/data/models/Vendor.dart';

import 'OrderProduct.dart';
import 'Payment.dart';

part 'Order.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Order {
  int id;
  String deliveryAddress;
  double orderTotal;
  double deliveryFee;
  String orderStatus;
  Vendor vendor;
  double itemsTotal;
  @JsonKey(nullable: true)
  OrderPayment payment;
  List<OrderProduct> products;

  Order({
    this.deliveryAddress,
    this.orderTotal,
    this.deliveryFee,
    this.orderStatus,
    this.vendor,
    this.itemsTotal,
    this.payment,
    this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

enum OrderStatus {
  CREATED,
  PAYMENT_CONFIRMED,
  STARTED,
  READY_FOR_PICKUP,
  OUT_FOR_DELIVERY,
  COMPLETED,
  CANCELED,
}

const ORDER_STATUS_STRING = {
  OrderStatus.CREATED: 'CREATED',
  OrderStatus.PAYMENT_CONFIRMED: 'PAYMENT_CONFIRMED',
  OrderStatus.STARTED: 'STARTED',
  OrderStatus.READY_FOR_PICKUP: 'READY_FOR_PICKUP',
  OrderStatus.OUT_FOR_DELIVERY: 'OUT_FOR_DELIVERY',
  OrderStatus.COMPLETED: 'COMPLETED',
  OrderStatus.CANCELED: 'CANCELED',
};
