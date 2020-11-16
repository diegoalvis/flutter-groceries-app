import 'package:flutter/material.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/VendorProduct.dart';

import 'counter_item.dart';

class ItemShoppingCard extends StatelessWidget {
  final int quantity;
  final VendorProduct product;
  final ValueChanged<int> onQuantityChanged;
  final Function onRemoveItem;

  const ItemShoppingCard({
    Key key,
    @required this.quantity,
    @required this.product,
    @required this.onQuantityChanged,
    this.onRemoveItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final basicInfo = product.product;
    return Column(
      children: [
        Container(
          height: 150,
          child: Row(
            children: [
              basicInfo.image?.url != null ? Image.network(ApiClient.BASE_URL + basicInfo.image.url) : Icon(Icons.image_not_supported_outlined),
              SizedBox(
                width: 20,
              ),
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
                            basicInfo.name,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: onRemoveItem,
                          child: Icon(
                            Icons.close,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    Text('1kg, Precio'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CounterItem(
                          onQuantityChanged: onQuantityChanged,
                          quantity: quantity,
                        ),
                        Text(
                          '\$ ${product.price * quantity}',
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
        Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
