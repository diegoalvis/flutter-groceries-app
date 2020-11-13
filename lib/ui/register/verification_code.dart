import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/ui/register/phone_validation_cubit.dart';

import '../screens/select_location_page.dart';

class VerificationCodePage extends StatefulWidget {
  final String _phoneNumber;

  VerificationCodePage(this._phoneNumber);

  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final _cubit = PhoneCubit(GetIt.I.get());
  final TextEditingController _pinController = TextEditingController();

  bool hasError = false;

  @override
  void initState() {
    _cubit.requestPhoneNumber(widget._phoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 50),
        child: BlocBuilder<PhoneCubit, BaseState>(
            cubit: _cubit,
            builder: (context, snapshot) {
              if (snapshot.type == StateType.success) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectLocationPage()));
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 34),
                    child: Text(
                      'Ingresa el código de 4-digitos',
                      style: TextStyle(
                        fontSize: 24,
                      ),
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
                        pinTheme: PinTheme(fieldWidth: 35, activeColor: Colors.black, selectedColor: Colors.white, inactiveColor: Colors.black),
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
                          _cubit.requestPhoneNumber(widget._phoneNumber);
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
                                _cubit.validatePhoneNumber(_pinController.text);
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
