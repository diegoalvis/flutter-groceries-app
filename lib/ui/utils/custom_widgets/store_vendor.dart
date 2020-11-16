import 'dart:math';

import 'package:flutter/material.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/Vendor.dart';

class VendorCard extends StatelessWidget {
  final Vendor vendor;

  const VendorCard({Key key, @required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(24.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          vendor.logo?.url != null ? Image.network(ApiClient.BASE_URL + vendor.logo.url) : Image.asset('assets/images/market.png'),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vendor.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text((Random().nextInt(10).toDouble() / 2.0).toString()),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Text('${vendor.hoursOfOperation?.hours ?? ''} ${vendor.hoursOfOperation?.days?.toLowerCase() ?? ''}'),
                Text('\$ ${vendor.deliveryFee?.toInt()} envío'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
