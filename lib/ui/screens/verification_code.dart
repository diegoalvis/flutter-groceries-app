import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

import 'select_location_page.dart';


class VerificationCodePage extends StatefulWidget {
  static const routeName = '/verification_code';
  final String _phoneNumber;


  VerificationCodePage(this._phoneNumber);


  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  TextEditingController _pinController = TextEditingController();
  bool hasError = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 34),
              child: Text(
                'Ingresa el código de 4-digitos',
                style: TextStyle(fontSize: 24,),
              ),
            ),
            Text('Ingrese el código enviado al celular ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 12,
            ),
            Text('${widget._phoneNumber}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: PinCodeTextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  controller: _pinController,
                  keyboardType: TextInputType.number,
                  length: 4,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  pinTheme: PinTheme(
                      fieldWidth: 35, activeColor: Colors.black, selectedColor: Colors.white, inactiveColor: Colors.black),
                  onCompleted: (v) {
                    print('Procesando...');
                  },
                )),
            Text(
              hasError ? '* Código incorrecto' : "",
              semanticsLabel: "error",
              style: Theme.of(context).textTheme.caption,
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
      ),
    );
  }
}
