import 'package:json_annotation/json_annotation.dart';
import 'package:winkels_customer/data/models/Order.dart';

import 'OrderProduct.dart';
import 'Payment.dart';

part 'OrderDTO.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class OrderDTO {
  int id;
  String deliveryAddress;
  double orderTotal;
  double deliveryFee;
  String orderStatus;
  String vendor;
  String usersPermissionsUser;
  double itemsTotal;
  OrderPayment payment;
  List<OrderProduct> products;

  OrderDTO({
    this.id,
    this.deliveryAddress,
    this.orderTotal,
    this.deliveryFee,
    this.orderStatus,
    this.vendor,
    this.usersPermissionsUser,
    this.itemsTotal,
    this.payment,
    this.products,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) => _$OrderDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDTOToJson(this);

  factory OrderDTO.fromOrder(Order order) {
    return OrderDTO(
      id: order.id,
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
