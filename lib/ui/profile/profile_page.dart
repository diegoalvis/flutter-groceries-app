import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 150,
                padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/img_account.png',
                    scale: 0.000001,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Francisco Garcia',
                textAlign: TextAlign.center,
              ),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mis Datos'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Nombre',
                          style: TextStyle(color: Colors.black45),
                        ),
                        TextField(
                          textInputAction: TextInputAction.search,
                          maxLength: 20,
                          textCapitalization: TextCapitalization.words,
                          // controller: _addressController,
                          decoration: InputDecoration(
                            hintText: 'Digita tu nombre',
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Apellido',
                          style: TextStyle(color: Colors.black45),
                        ),
                        TextField(
                          textInputAction: TextInputAction.search,
                          maxLength: 20,
                          textCapitalization: TextCapitalization.words,
                          // controller: _addressController,
                          decoration: InputDecoration(
                            hintText: 'Digita tu Apellido',
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Correo Electronico',
                          style: TextStyle(color: Colors.black45),
                        ),
                        TextField(
                          textInputAction: TextInputAction.search,
                          maxLength: 20,
                          textCapitalization: TextCapitalization.words,
                          // controller: _addressController,
                          decoration: InputDecoration(
                            hintText: 'Digita tu correo Electronico',
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Icon(Icons.error_outline),
                            SizedBox(
                              width: 30,
                            ),
                            Text('Cambiar Password'),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                height: double.infinity,
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                child: PrimaryButton(
                  buttonText: 'Guardar Cambios',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
