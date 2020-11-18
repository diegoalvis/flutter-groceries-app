import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/img_account.png',
              ),
            ),
            SizedBox(
              height: 20,
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
                        textInputAction: TextInputAction.done,
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
                        textInputAction: TextInputAction.done,
                        maxLength: 20,
                        textCapitalization: TextCapitalization.words,
                        // controller: _addressController,
                        decoration: InputDecoration(
                          hintText: 'Digita tu Apellido',
                        ),
                      )
                    ],
                  ),
                  Wrap(
                    children: [
                      Text(
                        'Correo Electronico',
                        style: TextStyle(color: Colors.black45),
                      ),
                      TextField(
                        textInputAction: TextInputAction.done,
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
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/change_password');
                        },
                        child: Row(
                          children: [
                            Icon(Icons.error_outline),
                            SizedBox(
                              width: 30,
                            ),
                            Text('Cambiar Password'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
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
    );
  }
}
