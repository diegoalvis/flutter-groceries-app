import 'package:json_annotation/json_annotation.dart';
import 'package:winkels_customer/data/models/Order.dart';

import 'OrderProduct.dart';
import 'Payment.dart';

part 'OrderDTO.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class OrderDTO {
  String id;
  String deliveryAddress;
  double orderTotal;
  double deliveryFee;
  String orderStatus;
  String vendor;
  double itemsTotal;
  OrderPayment payment;
  List<OrderProduct> products;

  OrderDTO({
    this.deliveryAddress,
    this.orderTotal,
    this.deliveryFee,
    this.orderStatus,
    this.vendor,
    this.itemsTotal,
    this.payment,
    this.products,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) => _$OrderDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDTOToJson(this);

  static OrderDTO fromOrder(Order order) {
    OrderDTO(
      deliveryAddress: order.deliveryAddress,
      orderTotal: order.orderTotal,
      deliveryFee: order.deliveryFee,
      orderStatus: order.orderStatus,
      vendor: order.vendor.id.toString(),
      itemsTotal: order.itemsTotal,
      payment: order.payment,
      products: order.products,
    );
  }
}
