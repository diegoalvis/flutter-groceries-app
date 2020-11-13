import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/ui/register/phone_validation_cubit.dart';

import '../screens/select_location_page.dart';

class VerificationCodePage extends StatelessWidget {
  final String phoneNumber;
  final TextEditingController _textController = TextEditingController();

  final _cubit = PhoneCubit(GetIt.I.get());

  VerificationCodePage(this.phoneNumber) {
    _cubit.requestPhoneNumber(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: height,
            width: width,
          ),
          BlocBuilder<PhoneCubit, BaseState>(
            cubit: _cubit,
            builder: (context, snapshot) {
              if(snapshot.type == StateType.success) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectLocationPage()));
              }

              if(snapshot.type == StateType.error) {
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Ocurrio un error al validar codigo")));
              }


              return Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 150,
                    ),
                    Text('Enviamos un codigo al numero $phoneNumber'),
                    Text(
                      'Ingresa el codigo de 6-digitos',
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
                                  controller: _textController,
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
                            _cubit.requestPhoneNumber(phoneNumber);
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
                                  _cubit.validatePhoneNumber(_textController.text);
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
