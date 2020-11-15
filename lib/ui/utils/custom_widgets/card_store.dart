import 'package:flutter/material.dart';
import 'package:winkels_customer/data/models/Vendor.dart';

class StoreCard extends StatelessWidget {
  final Vendor vendor;

  const StoreCard({Key key, @required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          vendor.logo?.url != null ? NetworkImage(vendor.logo.url) : Image.asset('assets/images/market.png'),
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
                          Text('4.5'),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Text('15 - 20 min - 0.4 kms '),
                Text('\$ 500 envío'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
