import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/login/login_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/welcome_background.png"),
              fit: BoxFit.cover,
            ),
          ),
      child: Center(
        child: Column(children: [
          Spacer(flex: 2),
          Icon(Icons.shopping_basket),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Bienvenido\na Winkels", textAlign: TextAlign.center, style: TextStyle(fontSize: 34)),
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Empezar"),
          ),
          Spacer(flex: 1),
        ]),
      ),
    ));
  }
}
