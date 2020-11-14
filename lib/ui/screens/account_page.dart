import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
            child:Row(
              children: [],
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
