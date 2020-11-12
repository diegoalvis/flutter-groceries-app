import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'select_location_page.dart';

class VerificationCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 150,
                ),
                Text(
                  'Ingresa el codigo de 4-digitos',
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Codigo'),
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            child: TextFormField(
                              maxLength: 4,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              ],
                              validator: (value) {
                                if (value.length == 4) {
                                  return null;
                                }
                                return 'Número incorrecto';
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Flexible(child: Container(height: double.infinity, width: double.infinity)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        debugPrint('222');
                        Navigator.pushNamed(context, '/registro');
                      },
                      child: Text(
                        "Reenviar Codigo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      child: Center(
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.green,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SelectLocationPage()));
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
