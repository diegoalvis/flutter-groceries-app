import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
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
              : Column(
                  children: [
                    Text('Resumen de la compra'),
                    Expanded(
                      child: ListView(
                        children: cart.items.entries.map((e) {
                          return ItemShoppingCard(
                            product: e.key,
                            quantity: e.value,
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Orden'),
                          Text('\$${cart.itemsPrice}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0, left: 24.0, right: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Domicilio'),
                          Text('\$${cart.deliveryFee}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('\$${cart.total}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: PrimaryButton(
                        buttonText: "Continuar con el pago",
                        buttonColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          Navigator.pushNamed(context, '/my_cart');
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
