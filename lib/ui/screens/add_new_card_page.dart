import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddNewCardPage extends StatefulWidget {
  @override
  _AddNewCardPageState createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Row(
                children: [
                  Text(
                    "Metodo de pago",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      debugPrint('agregar neuva tarjeta');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 5,
                        ),
                        Text('agregar tarjeta'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused, //true when you want to show cvv(back) view
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  onCreditCardModelChange: onCreditCardModelChange,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
