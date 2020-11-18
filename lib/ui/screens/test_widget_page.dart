import 'package:flutter/material.dart';

class TestWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OrderDetailCard(textMethodPay: 'Pago en efectivo',costOrder: '\$ 21090',),
      ),
    );
  }
}

class OrderDetailCard extends StatelessWidget {
  final String textMethodPay;
  final String costOrder;
  const OrderDetailCard({
    Key key, this.textMethodPay, this.costOrder,
  }) : super(key: key);

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
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(textMethodPay,style: TextStyle(fontSize: 20, ),),
                  Text(costOrder,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
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
