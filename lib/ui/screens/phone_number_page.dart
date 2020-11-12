import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'verification_code.dart';

class PhoneNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back_ios_outlined),
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      // ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/bag.png',
            fit: BoxFit.cover,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              bottom: 20
            ),
            child: Column(
              children: [

                Text(
                  'Consigue lo que necesitas\a con Winkels',
                  style: TextStyle(fontSize: 22),
                ),
                Row(
                  children: [
                    Image.asset('icons/flags/png/2.5x/co.png', scale: 5, package: 'country_icons'),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '+ 57',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(
                      child: Form(
                        child: TextFormField(
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          // inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                          validator: (value) {
                            if (value.length == 10 && value.startsWith('3')) {
                              return null;
                            }
                            return 'Número incorrecto';
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10, top: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(child: Container(height: double.infinity, width: double.infinity)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationCodePage()));
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
