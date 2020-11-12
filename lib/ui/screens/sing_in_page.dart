import 'package:flutter/material.dart';

import 'home_page.dart';

class SingInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back_ios_outlined),
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      // ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              Image.asset(
                'assets/images/bag.png',
                fit: BoxFit.cover,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Completa tu registro',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Flexible(child: Container(height: double.infinity, width: double.infinity)),
                      IconPrimaryButton(
                        buttonText: 'Ingreso con correo',
                        icon: 'assets/icons/ic_google.png',
                        buttonColor: Color(0xffC5C9D0),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      IconPrimaryButton(
                        buttonText: 'Continua con Google',
                        icon: 'assets/icons/ic_google.png',
                        buttonColor: Color(0xff5383EC),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      IconPrimaryButton(
                        buttonText: 'Continua con Facebook',
                        icon: 'assets/icons/ic_google.png',
                        buttonColor: Color(0xff4A66AC),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Ya tienes una cuenta?'),
                          GestureDetector(
                            onTap: () {
                              debugPrint('222');
                              Navigator.pushNamed(context, '/registro');
                            },
                            child: Text(
                              ' Ingresar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('222');
                          Navigator.pushNamed(context, '/registro');
                        },
                        child: Text(
                          ' Omitir este paso',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconPrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final Color buttonColor;
  final String icon;

  IconPrimaryButton({Key key, @required this.buttonText, this.onPressed, this.buttonColor, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 30),
              child: Image.asset(icon),
            ),
            Text(
              buttonText,
              style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        onPressed: this.onPressed,
        color: buttonColor,
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}
