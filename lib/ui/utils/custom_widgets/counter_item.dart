import 'package:flutter/material.dart';

class CounterItem extends StatelessWidget {
  final int cant;

  const CounterItem({
    Key key,
    this.cant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Icon(Icons.remove, color: Colors.red),
            ),
          ),
          Container(
            width: 40,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                child: Text(
                  cant.toString(),
                  style: TextStyle(color: Color(0xff164193), fontSize: 18),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Icon(Icons.add, color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
