import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.blue,
            child:Row(
              children: [
                Image.asset('assets/images/img_account.png'),
                SizedBox(width: 20,),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'nameProduct',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(width: 10,),

                              Icon(Icons.close, color: Colors.black38,),
                            ],
                          ),
                          Text('1kg, Precio'),
                          SizedBox(height: 10,),

                        ],
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: ListView.builder(
                padding: EdgeInsets.all(0.0),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 2),
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
            height: 150,
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}
