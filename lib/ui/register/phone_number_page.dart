import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'verification_code_page.dart';

class PhoneNumberPage extends StatefulWidget {
  @override
  _PhoneNumberPageState createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  TextEditingController _textController = TextEditingController();
  String countryCode = "+57";

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/bag.png',
            fit: BoxFit.cover,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
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
                        key: _formKey,
                        child: TextFormField(
                          maxLength: 10,
                          controller: _textController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          // inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                          validator: (value) {
                            if (value.length == 10) {
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
                              if (_formKey.currentState.validate() && _textController.text.isNotEmpty) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationCodePage(countryCode + _textController.text)));
                              }
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
