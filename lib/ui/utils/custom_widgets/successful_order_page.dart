import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

class SuccessfulOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/img_successful_order.png'),
            Text(
              'Tu orden ha sido\n Aceptada',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Tus artículos han sido recibidos y están\n siendo procesados',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            PrimaryButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/order_history');
                },
                buttonText: 'Seguir Pedido'),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                debugPrint('222');
                Navigator.pop(context);
              },
              child: Text("Volver", textAlign: TextAlign.center, style: TextStyle(color: Colors.green, fontSize: 20.0)),
            )
          ],
        ),
      ),
    );
  }
}
