import 'package:flutter/material.dart';

import 'counter_item.dart';

class ItemShoppingCard extends StatelessWidget {
  final int cant;
  final String nameProduct;
  final  String imageAsset;
  final int priceProduct;
  const ItemShoppingCard({
    Key key, this.cant, this.imageAsset, this.nameProduct, this.priceProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          child: Row(
            children: [
              Image.asset(imageAsset),
              SizedBox(width: 20,),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                nameProduct,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(width: 10,),

                            Icon(Icons.close, color: Colors.black38,),
                          ],
                        ),
                        Text('1kg, Precio'),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CounterItem(cant: this.cant,),
                            Text(
                              '\$ $priceProduct',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        Divider(thickness: 1,),
      ],
    );
  }
}

