import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/row_list_pay.dart';

class CheckoutModal extends StatefulWidget {
  @override
  _CheckoutModalState createState() => _CheckoutModalState();
}

class _CheckoutModalState extends State<CheckoutModal> {

  // final _stripePayment = GetIt.I.get<FlutterStripePayment>();
  String  _paymentMethodId;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          child: Row(
            children: [
              Text(
                "Confirmar pago",
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
              InkWell(
                onTap: () async {
                  // var paymentResponse = await _stripePayment.addPaymentMethod();
                  // setState(() {
                  //   if (paymentResponse.status ==
                  //       PaymentResponseStatus.succeeded) {
                  //     _paymentMethodId = paymentResponse.paymentMethodId;
                  //   } else {
                  //     print(paymentResponse.errorMessage);
                  //   }
                  // });


                  // StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest()).then((PaymentMethod paymentMethod) {
                  //   setState(() {
                  //     _paymentMethod = paymentMethod;
                  //     StripePayment.authenticatePaymentIntent(clientSecret: null)
                  //   });
                  //   print('Received ${paymentMethod.id}');
                  // }).catchError((e) {
                  //   print('error ${e.toString()}');
                  // });
                },
                child: RowListElement(
                  nameListItem: 'Forma de Pago',
                  iconVisible: true,
                  widgetListSelect: Image.asset('assets/icons/ic_pay_card.png'),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              RowListElement(
                nameListItem: 'Codigo promocional',
                iconVisible: true,
                widgetListSelect: Text('Agregar descuento'),
              ),
              Divider(
                thickness: 2,
              ),
              RowListElement(
                nameListItem: 'Costo productos',
                widgetListSelect: Text('\$130000'),
              ),
              Divider(
                thickness: 2,
              ),
              RowListElement(
                nameListItem: 'Costo Envio',
                widgetListSelect: Text('\$1000'),
              ),
              Divider(
                thickness: 2,
              ),
              RowListElement(
                nameListItem: 'Costo total',
                widgetListSelect: Text('\$59000'),
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
                height: 20,
              ),
              PrimaryButton(
                buttonText: 'Realizar pedido',
                onPressed: _paymentMethodId == null
                    ? null
                    : () {


                        // StripePayment.confirmPaymentIntent(
                        //   PaymentIntent(
                        //     paymentMethodId: _paymentMethod.id,
                        //     clientSecret: "test",
                        //   ),
                        // ).then((paymentIntent) {
                        //   print('Received ${paymentIntent.paymentIntentId}');
                        //   setState(() {
                        //     _paymentIntent = paymentIntent;
                        //   });
                        // }).catchError((e) {
                        //   print('error ${e.toString()}');
                        // });
                      },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
