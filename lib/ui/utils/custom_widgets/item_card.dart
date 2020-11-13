
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String text;
  final String imageAsset;

  const ItemCard({
    Key key,
    @required this.text,
    @required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 300,
      width: 180,
      //Creo q no es necesario el ancho cuando se ponga en el grid
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(imageAsset),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('180g, precio'),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$1200',
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0xff53B175),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
