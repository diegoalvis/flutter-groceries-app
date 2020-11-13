import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/card_store.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/category_item.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/item_card.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/search_text_field.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back_ios_outlined),
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      // ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 10,
                    ),
                    Text('La Felicidad, Bogotá'),
                    Icon(
                      Icons.location_on,
                      color: Colors.transparent,
                    ),
                  ],
                ),
                Text(
                  'Categorias',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                SearchTextField(
                  hintText: 'Buscar Categoria',
                ),
                CategoryCard(
                  text: 'Viveres',
                  imageAsset: 'assets/icons/ic_viveres.png',
                ),
                StoreCard(
                  nameStore: 'Tienda 1',
                ),
                ItemCard(
                  text: 'Huevos Blancos',
                  imageAsset: 'assets/images/img_egg.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
