import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String buttonText;
  final Function onPressed;
  final Color buttonColor;

  PrimaryButton({Key key, @required this.buttonText, this.onPressed, this.buttonColor: const Color(0xff164193), })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        onPressed: this.onPressed,
        color: buttonColor,
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}
