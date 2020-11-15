import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cambiar Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Password Actual',
                      style: TextStyle(color: Colors.black45),
                    ),
                    TextField(
                      textInputAction: TextInputAction.search,
                      textCapitalization: TextCapitalization.words,

                      // controller: _addressController,
                    )
                  ],
                ),

                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Nueva Password',
                      style: TextStyle(color: Colors.black45),
                    ),
                    TextField(
                      textInputAction: TextInputAction.search,
                      textCapitalization: TextCapitalization.words,

                      // controller: _addressController,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Confirmar nueva Password',
                      style: TextStyle(color: Colors.black45),
                    ),
                    TextField(
                      textInputAction: TextInputAction.search,
                      textCapitalization: TextCapitalization.words,

                      // controller: _addressController,
                    )
                  ],
                ),
                Expanded(
                    child: Container(
                      height: double.infinity,
                    )),
                PrimaryButton(
                  buttonText: 'Guardar Cambios',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
