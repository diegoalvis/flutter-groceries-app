import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String buttonText;
  final Function onPressed;
  final Color buttonColor;
  final TextStyle style;

  static const TextStyle defaultStyle = TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold);


  PrimaryButton({Key key, @required this.buttonText, this.onPressed, this.buttonColor, this.style: defaultStyle })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            buttonText,
            style: this.style,
          ),
          onPressed: this.onPressed,
          color: buttonColor,
          padding: EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
