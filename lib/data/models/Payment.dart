
import 'package:json_annotation/json_annotation.dart';

part 'Payment.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class OrderPayment {
  String paymentId;
  String paymentType;
  String paymentMethod;
  String status;
  String totalAmount;

  OrderPayment({this.paymentId, this.paymentType, this.paymentMethod, this.status, this.totalAmount});

  factory OrderPayment.fromJson(Map<String, dynamic> json) => _$OrderPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPaymentToJson(this);
  
}
