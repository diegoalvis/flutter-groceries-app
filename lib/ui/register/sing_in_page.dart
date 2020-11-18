import 'package:flutter/material.dart';

class SingInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bag.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
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
                    SizedBox(height: 20,),
                    IconPrimaryButton(
                      buttonText: 'Ingreso con correo',
                      buttonColor: Color(0xffC5C9D0),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
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
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    IconPrimaryButton(
                      buttonText: 'Continua con Facebook',
                      icon: 'assets/icons/ic_facebook.png',
                      buttonColor: Color(0xff4A66AC),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
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
                            Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
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
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
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
            ],
          ),
        ],
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
            Padding(padding: const EdgeInsets.only(left: 10.0, right: 30), child: icon == null ? Icon(Icons.email, color: Colors.grey,) : Image.asset(icon)),
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
