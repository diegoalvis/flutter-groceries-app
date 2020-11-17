import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:winkels_customer/ui/checkout/checkout_modal.dart';
import 'package:winkels_customer/ui/home/destination.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/item_shopping_card.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

import 'cart_model.dart';

class CartPage extends StatelessWidget {
  final Destination destination;
  final Function(String route) onChangeCurrentPage;

  const CartPage({Key key, this.destination, this.onChangeCurrentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8, bottom: 8),
          child: cart.items.entries.isEmpty
              ? Center(child: Text('Aun no has agregado\nproductos en tu carrito'))
              : Column(children: [
                  Text('Tu carrito'),
                  Expanded(
                    child: ListView(
                      children: cart.items.entries.map((e) {
                        final product = e.key;
                        final quantity = e.value;
                        return ItemShoppingCard(
                          product: product,
                          quantity: quantity,
                          onRemoveItem: () => cart.removeItem(product),
                          onQuantityChanged: (int value) {
                            if (value > quantity) {
                              cart.increase(product);
                            } else {
                              cart.decrease(product);
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: PrimaryButton(
                        buttonText: "Continuar",
                        buttonColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (ctx) {
                              return CheckoutModal(onCheckoutError: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext dialogContext) {
                                    return AlertDialog(
                                      title: Text('Lo sentimos'),
                                      content: Text('No se pudo completar la compra'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('aceptar'),
                                          onPressed: () {
                                            Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                            },
                          );
                        },
                      ))
                ]),
        ),
      ),
    );
  }
}
