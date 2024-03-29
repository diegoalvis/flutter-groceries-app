import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/data/preferences/preferences.dart';
import 'package:winkels_customer/ui/register/phone_number_page.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    validateUserAuth(context);
    super.initState();
  }

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
                child: Text("Bienvenido\na Winkels", textAlign: TextAlign.center, style: TextStyle(fontSize: 34, color: Colors.white)),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneNumberPage()));
                },
              ),
              SizedBox(
                height: 60,
              )
            ]),
          ),
        ),
      ],
    ));
  }

  Future validateUserAuth(BuildContext context) async {
    final pref = await GetIt.I.getAsync<Preferences>();
    if (pref.isUserLoggedIn() && pref.getAuthToken() != null) {
      Navigator.pushReplacementNamed(context, pref.getAddress() != null ? '/home' : '/select_address');
    }
  }
}
