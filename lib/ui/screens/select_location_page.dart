import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/screens/sing_in_page.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

class SelectLocationPage extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Selecciona tu Ubicacion',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 220,
                  child: Text(
                    'Activa tu ubicación para que contactes con los comercios que están en tu zona',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                    child: Container(
                  height: double.infinity,
                  width: double.infinity,
                ),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Tu ciudad',
                      style: TextStyle(color: Colors.black45),
                    ),
                    TextField(
                      controller: TextEditingController()..text = 'Bogotá',
                      textInputAction: TextInputAction.search,
                      maxLength: 60,
                      textCapitalization: TextCapitalization.words,
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Direccion',
                      style: TextStyle(color: Colors.black45),
                    ),
                    TextField(
                      textInputAction: TextInputAction.search,
                      maxLength: 60,
                      textCapitalization: TextCapitalization.words,
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        hintText: 'Digita tu direccion completa',
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  buttonText: 'Enviar',
                  buttonColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SingInPage()));
                  },
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
