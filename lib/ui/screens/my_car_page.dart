import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/card_store.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/category_item.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/item_shopping_card.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/search_text_field.dart';

class MyCarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
            child: ItemShoppingCard(cant: 20,nameProduct: 'Pimentón rojo Pimentón ', priceProduct: 1200, imageAsset: 'assets/images/img_pimenton.png',),
          ),
        ),
      ),
    );
  }
}

