import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 174.5,
        height: 189.10609436035156,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 174.5,
                height: 189.10609436035156,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 174.5,
                            height: 189.10609436035156,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18),
                                bottomLeft: Radius.circular(18),
                                bottomRight: Radius.circular(18),
                              ),
                              boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0), offset: Offset(0, 6), blurRadius: 12)],
                              color: Color.fromRGBO(83, 177, 117, 0.10000000149011612),
                              border: Border.all(
                                color: Color.fromRGBO(83, 177, 117, 1),
                                width: 1,
                              ),
                            ))),
                    Positioned(
                        top: 22.49737548828125,
                        left: 23.994140625,
                        child: Container(
                            width: 124,
                            height: 114,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/Pngfuel6.png'), fit: BoxFit.fitWidth),
                            ))),
                    Positioned(
                      top: 141.10614013671875,
                      left: 65.25,
                      child: Text(
                        'Viveres',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(24, 23, 37, 1),
                            fontFamily: 'Abel',
                            fontSize: 16,
                            letterSpacing: 0.10000000149011612,
                            fontWeight: FontWeight.normal,
                            height: 1.375),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
