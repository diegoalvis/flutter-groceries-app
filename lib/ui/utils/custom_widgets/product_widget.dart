import 'package:flutter/material.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/base_product.dart';

class ProductWidget extends StatelessWidget {

  final BaseProduct product;

  const ProductWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(ApiClient.BASE_URL + (product.image?.url ?? "")),
          Text(product.name),
          Text(product.description  ?? "..."),
          Row(
            children: [
              Text("121.3"),
              Icon(Icons.add, color: Colors.green),
            ],
          )
        ],
      ),
    );
  }
}
