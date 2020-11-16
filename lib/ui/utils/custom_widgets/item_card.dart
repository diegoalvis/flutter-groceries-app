import 'dart:math';

import 'package:flutter/material.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/VendorProduct.dart';

import 'counter_item.dart';

class ItemCard extends StatefulWidget {
  final VendorProduct product;
  final ValueChanged<int> onQuantityChanged;

  const ItemCard({Key key, @required this.product, this.onQuantityChanged}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    final basicInfo = widget.product.product;
    return Container(
      margin: EdgeInsets.all(6.0),
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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: basicInfo.image?.url != null ? Image.network(ApiClient.BASE_URL + basicInfo.image.url) : Icon(Icons.image_not_supported_outlined),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(basicInfo.name),
                  SizedBox(height: 8),
                  Text(basicInfo.description ?? ''),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${widget.product.price}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => setState(() {
                                _quantity = max(0, _quantity - 1);
                              }),
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Icon(Icons.remove, color: Colors.red),
                              ),
                            ),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () => setState(() {
                                _quantity = min(99, _quantity + 1);
                              }),
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Icon(Icons.add, color: Colors.green),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              ))
            ],
          ),
          _quantity == 0
              ? SizedBox()
              : Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  alignment: Alignment.center,
                  child: Text('$_quantity', style: TextStyle(color: Colors.white)),
                ),
              )
        ],
      ),
    );
  }
}
