import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/models/City.dart';
import 'package:winkels_customer/ui/address/select_address_cubit.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

class SelectAddressPage extends StatefulWidget {
  City currentCity;

  SelectAddressPage({Key key, this.currentCity}) : super(key: key);

  @override
  _SelectAddressPageState createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final _cubit = SelectAddressCubit(GetIt.I.get());

  @override
  void dispose() {
    _addressController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocListener<SelectAddressCubit, BaseState>(
              cubit: _cubit,
              listener: (BuildContext context, BaseState state) {
                if (state.type == StateType.navigate) {
                  Navigator.pushNamedAndRemoveUntil(context, '/sing_in', (Route<dynamic> route) => false);
                }
              },
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Selecciona tu Ubicacion',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                    height: 30,
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
                                widget.currentCity?.name ?? 'Tu ciudad',
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
                        controller: _addressController,
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
                    onPressed: widget.currentCity == null || _addressController.text == null || _addressController.text.length < 4
                        ? null
                        : () {
                            _cubit.saveAddress(_addressController.text, widget.currentCity);
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
      ),
    );
  }

  Widget buildCityList() {
    List<City> cityList = _cubit.mockACityList;
    return Container(
        height: 200.0,
        width: 200.0,
        child: ListView.separated(
            separatorBuilder: (c, i) => SizedBox(height: 12.0),
            itemBuilder: (c, index) {
              return InkWell(
                onTap: () => {
                  setState(() {
                    widget.currentCity = cityList[index];
                  }),
                  Navigator.of(context, rootNavigator: true).pop(),
                },
                child: Container(
                  height: 40,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Text(cityList[index].name, style: TextStyle(color: Colors.black45)),
                    widget.currentCity == cityList[index] ? Icon(Icons.check_circle, size: 22) : SizedBox()
                  ]),
                ),
              );
            },
            itemCount: cityList?.length ?? 0));
  }
}
