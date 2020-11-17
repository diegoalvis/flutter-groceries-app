
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/VendorProduct.dart';
import 'package:winkels_customer/ui/cart/cart_model.dart';

class ItemCard extends StatelessWidget {
  final VendorProduct product;
  final Vendor vendor;

  const ItemCard({Key key, this.product, this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    var quantity = cart.items.entries.firstWhere((element) => element.key.id == product.id, orElse: () => null)?.value ?? 0;
    final basicInfo = product.product;
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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        "\$ ${product.price}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => cart.decrease(product, vendor: vendor),
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
                          InkWell(
                            onTap: () => cart.increase(product, vendor: vendor),
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
                      )
                    ],
                  ))
                ],
              ))
            ],
          ),
          quantity == 0
              ? SizedBox()
              : Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                    alignment: Alignment.center,
                    child: Text('$quantity', style: TextStyle(color: Colors.white)),
                  ),
                )
        ],
      ),
    );
  }
}
