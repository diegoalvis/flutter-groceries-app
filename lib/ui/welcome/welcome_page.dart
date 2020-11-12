import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/login/login_page.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image(
          image: AssetImage("assets/images/welcome_background.png"),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("Bienvenido\na Winkels",
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 34, color: Colors.white)),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Consigue los productos que necesitas más fácil y rápido",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  )),
              SizedBox(
                height: 30,
              ),
              PrimaryButton(
                buttonText: "Empezar",
                buttonColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              SizedBox(height: 60,)
            ]),
          ),
        ),
      ],
    ));
  }
}
