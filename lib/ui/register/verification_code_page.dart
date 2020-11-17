import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/ui/register/phone_validation_cubit.dart';

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
    _cubit.requestSMSCode(widget._phoneNumber);
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 50),
        child: BlocListener(
          cubit: _cubit,
          listener: (BuildContext context, state) {
            if (state.type == StateType.success) {
              Navigator.pushNamed(context, '/select_address');
            }
            if (state.type == StateType.error) {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("Codigo no valido")));
            }
          },
          child: BlocBuilder<PhoneCubit, BaseState>(
              cubit: _cubit,
              builder: (context, state) {
                if (state.type == StateType.success) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 34),
                      child: Text(
                        'Ingresa el código de 6-digitos',
                        style: TextStyle(fontSize: 24),
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
                          length: 6,
                          cursorColor: Colors.black,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          animationType: AnimationType.fade,
                          animationDuration: Duration(milliseconds: 200),
                          backgroundColor: Colors.transparent,
                          pinTheme:
                              PinTheme(fieldWidth: 35, activeColor: Colors.black, selectedColor: Theme.of(context).accentColor, inactiveColor: Colors.black),
                          onCompleted: (v) {},
                          appContext: context,
                          onChanged: (String value) {},
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
                            _cubit.requestSMSCode(widget._phoneNumber);
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
                                  Navigator.pushNamed(context, '/select_address');

                                  _cubit.validatePhoneNumber(widget._phoneNumber, _pinController.text);
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
      ),
    );
  }
}
