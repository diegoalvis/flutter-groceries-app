import 'package:json_annotation/json_annotation.dart';
import 'package:winkels_customer/data/models/Vendor.dart';

import 'OrderProduct.dart';
import 'Payment.dart';

part 'Order.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Order {
  String id;
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
