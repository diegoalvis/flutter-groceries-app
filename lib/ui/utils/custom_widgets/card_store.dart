import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final String nameStore;

  const StoreCard({
    Key key,@required this.nameStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/market.png'),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(nameStore, style: TextStyle(fontSize: 20),),
                    Container(
                      child: Row(
                        children: [
                          Text('4.5'),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Text('15 - 20 min - 0.4 kms '),
                Text('\$ 500 envío'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
