import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/img_account.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              'Francisco Garcia Garcia',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.edit_outlined,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      Text('fgarcia@gmail.com'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 1),
                    child: ListTile(
                      leading: Icon(
                        Icons.equalizer_rounded,
                        size: 45,
                      ),
                      title: Text(
                        "Option ${index + 1}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 45,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            child: PrimaryButton(
              buttonText: 'Salir',
              buttonColor: Color(0xffF2F3F2),
              style: TextStyle(color: Colors.green, fontSize: 20.0,),
              onPressed: () {

              },
            ),
          )
        ],
      ),
    );
  }
}
