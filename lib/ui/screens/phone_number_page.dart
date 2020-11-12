import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberPage extends StatelessWidget {
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
          Column(
            children: [
              Image.asset(
                'assets/images/bag.png',
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Consigue lo que necesitas con Winkels',
                      ),
                      Row(
                        children: [
                          Image.asset('icons/flags/png/2.5x/co.png', scale: 5, package: 'country_icons'),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '+ 57',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                          Expanded(
                            child: Form(
                              child: TextFormField(
                                maxLength: 10,
                                // inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                                validator: (value) {
                                  if (value.length == 10 && value.startsWith('3')) {
                                    return null;
                                  }
                                  return 'Número incorrecto';
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10, top: 20),
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.black,),
                      Flexible(child: Container(height: double.infinity, width: double.infinity)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
