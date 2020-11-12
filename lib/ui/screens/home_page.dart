import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/card_store.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/category_item.dart';
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

class ItemCard extends StatelessWidget {
  final String text;
  final String imageAsset;

  const ItemCard({
    Key key,
    @required this.text,
    @required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 300,
      width: 180,
      //Creo q no es necesario el ancho cuando se ponga en el grid
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(imageAsset),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
              ),
              SizedBox(
                height: 8,
              ),
              Text('180g, precio'),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$1200',
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xff53B175),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ))
        ],
      ),
    );
  }
}
