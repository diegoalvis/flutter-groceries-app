import 'package:flutter/material.dart';
import 'package:winkels_customer/data/models/Order.dart';

class OrderItemCard extends StatelessWidget {
  final Order order;

  const OrderItemCard({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/market.png'),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    order.vendor?.name ?? '',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(order.orderTotal.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ],
              ),
              Spacer(),
              Text(
                'Ver detealle',
                style: TextStyle(color: Colors.yellow, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
