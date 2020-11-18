import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mercado_pago_integration/core/failures.dart';
import 'package:mercado_pago_integration/mercado_pago_integration.dart';
import 'package:mercado_pago_integration/models/payment.dart';
import 'package:winkels_customer/core/cubit/base_cubit.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/core/payment/payment_helper.dart';
import 'package:winkels_customer/data/models/Order.dart';
import 'package:winkels_customer/data/models/OrderDTO.dart';
import 'package:winkels_customer/data/models/OrderProduct.dart';
import 'package:winkels_customer/data/models/Payment.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/VendorProduct.dart';
import 'package:winkels_customer/data/preferences/preferences.dart';
import 'package:winkels_customer/data/repository/Repository.dart';

class CheckoutCubit extends BaseCubit {
  CheckoutCubit(Repository repository) : super(repository);

  Preferences _preferences = GetIt.I.get();

  Future<void> startCheckout(double totalPrice, Map<VendorProduct, int> items, double itemsPrice, Vendor vendor, {ValueChanged<StateType> onResult}) async {
    emit(BaseState(StateType.loading));
    try {
      final order = await createOrder(totalPrice, vendor, itemsPrice, items);
      final userPhone = repository.getUserPhone();
      final Map<String, Object> preferenceMap = {
        'items': [
          {
            'title': 'Test Order',
            'description': 'Winkels order',
            'quantity': 1,
            'order_id': order.id.toString(),
            'unit_price': totalPrice.toInt(),
            'currency_id': 'COP',
          }
        ],
        "payer": {
          "email": "test@winkels.com",
          "phone": {"number": userPhone},
        }
      };

      final checkoutReq = await MercadoPagoIntegration.startCheckout(
        publicKey: PaymentHelper.PUBLIC_KEY,
        preference: preferenceMap,
        accessToken: PaymentHelper.ACCESS_TOKEN,
      );

      checkoutReq.fold(
        (Failure failure) {
          onResult(StateType.error);
        },
        (Payment payment) async {
          updateOrderPayment(order, payment, onResult);
        },
      );
    } catch (e) {
      emit(BaseState(StateType.error));
    }
  }

  Future<void> updateOrderPayment(Order order, Payment payment, ValueChanged<StateType> onResult) async {
    try {
      order.payment = OrderPayment(
        paymentId: payment.paymentId,
        paymentType: payment.paymentTypeId,
        paymentMethod: payment.paymentMethodId,
        status: payment.status,
        totalAmount: payment.transactionAmount.toString(),
      );

      final res = await repository.updateOrder(OrderDTO.fromOrder(order));
      onResult(StateType.success);
      emit(BaseState(StateType.success, data: payment));
    } catch (e) {
      // 4013 5406 8274 6260
      // 5254 1336 7440 3564
      onResult(StateType.error);
      emit(BaseState(StateType.error));
    }
  }

  Future<Order> createOrder(double totalPrice, Vendor vendor, double itemsPrice, Map<VendorProduct, int> items) async {
    return repository.createOrder(
      OrderDTO(
        deliveryAddress: _preferences.getAddress().getFullAddress(),
        orderTotal: totalPrice,
        orderStatus: ORDER_STATUS_STRING[OrderStatus.CREATED],
        deliveryFee: vendor.deliveryFee,
        vendor: '${vendor.id}',
        itemsTotal: itemsPrice,
        products: items.entries.map((e) {
          return OrderProduct(
            name: e.key.product.name,
            description: e.key.product.description,
            unitPrice: e.key.price,
            quantity: e.value,
          );
        }).toList(),
      ),
    );
  }
}
