import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/register/sing_in_page.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

class SelectLocationPage extends StatefulWidget {
  @override
  _SelectLocationPageState createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  final TextEditingController _controller = new TextEditingController();

  String selectedCity;

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
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                                title: Text("Elige tu ciudad", style: TextStyle(color: Colors.black45)),
                                content: buildCityList(),
                              );
                            });
                      },
                      child: Container(
                        height: 40.0,
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.black, width: 1.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              selectedCity ?? 'Tu ciudad',
                              style: TextStyle(color: Colors.black45),
                            ),
                            Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 24)
                          ],
                        ),
                      ),
                    ),
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
                  onPressed: selectedCity == null
                      ? null
                      : () {
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

  Widget buildCityList() {
    List<String> cityList = ["Bogota", "Medellin"];
    return Container(
        height: 200.0,
        width: 200.0,
        child: ListView.separated(
            separatorBuilder: (c, i) => SizedBox(height: 12.0),
            itemBuilder: (c, index) {
              return InkWell(
                onTap: () => {
                  setState(() {
                    selectedCity = cityList[index];
                  }),
                  Navigator.of(context, rootNavigator: true).pop(),
                },
                child: Container(
                  height: 40,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Text(cityList[index], style: TextStyle(color: Colors.black45)),
                    selectedCity == cityList[index] ? Icon(Icons.check_circle, size: 22) : SizedBox()
                  ]),
                ),
              );
            },
            itemCount: cityList?.length ?? 0));
  }
}
