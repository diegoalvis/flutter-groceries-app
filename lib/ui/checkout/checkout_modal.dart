import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/ui/cart/cart_model.dart';
import 'package:winkels_customer/ui/checkout/checkout_cubit.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/row_list_pay.dart';

class CheckoutModal extends StatelessWidget {
  final Function onCheckoutError;

  CheckoutModal({Key key, @required this.onCheckoutError}) : super(key: key);

  final _cubit = CheckoutCubit(GetIt.I.get());

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context, listen: false);
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          child: Row(
            children: [
              Text(
                "Resumen de la compra",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                ),
              ),
              InkWell(onTap: () => Navigator.pop(context), child: Icon(Icons.close)),
            ],
          ),
        ),
        Divider(
          thickness: 2,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowListElement(
                nameListItem: 'Codigo promocional',
                iconVisible: true,
                widgetListSelect: Text('Agregar cupon'),
              ),
              Divider(
                thickness: 2,
              ),
              RowListElement(
                nameListItem: 'Costo productos',
                widgetListSelect: Text('\$${cart.itemsPrice}'),
              ),
              Divider(
                thickness: 2,
              ),
              RowListElement(
                nameListItem: 'Costo envio',
                widgetListSelect: Text('\$${cart.deliveryFee}'),
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  Text(
                    'Total a pagar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    '\$${cart.orderTotal}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Al realizar el pedido aceptas nuestros'),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Terminos y condiciones",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              BlocListener(
                cubit: _cubit,
                listener: (BuildContext context, state) {
                  if (state.type == StateType.error) {
                    Navigator.pop(context);
                    onCheckoutError();
                  }
                },
                child: BlocBuilder<CheckoutCubit, BaseState>(
                    cubit: _cubit,
                    builder: (context, state) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        child: state.type == StateType.loading
                            ? Center(child: CircularProgressIndicator())
                            : PrimaryButton(
                                buttonText: 'Seleccionar metodo de pago',
                                onPressed: () {
                                  _cubit.startCheckout(cart.orderTotal);
                                },
                              ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
