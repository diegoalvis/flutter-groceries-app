import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/row_list_pay.dart';


class PaymentMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void displayBottomSheet(BuildContext context) {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (ctx) {
            return Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Pagar",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                        ),
                      ),
                      Icon(Icons.close),
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
                        nameListItem: 'Entrega',
                        iconVisible: true,
                        widgetListSelect: Text(
                          "Seleccion metodo",
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      RowListElement(
                        nameListItem: 'Forma de Pago',
                        iconVisible: true,
                        widgetListSelect: Image.asset('assets/icons/ic_pay_card.png'),
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click the floating action button to show bottom sheet.',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => displayBottomSheet(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
