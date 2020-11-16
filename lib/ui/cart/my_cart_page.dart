import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:winkels_customer/ui/home/destination.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/item_shopping_card.dart';

class MyCartPage extends StatelessWidget {

  final Destination destination;
  final Function(String route) onChangeCurrentPage;

  const MyCartPage({Key key, this.destination, this.onChangeCurrentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
            child: Column(
              children: [
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón Pimentón rojo Pimentón Pimentón rojo Pimentón Pimentón rojo Pimentón  ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
                ItemShoppingCard(
                  cant: 20,
                  nameProduct: 'Pimentón rojo Pimentón ',
                  priceProduct: 1200,
                  imageAsset: 'assets/images/img_pimenton.png',
                ),
              ],
            )),
      ),
    );
  }
}
