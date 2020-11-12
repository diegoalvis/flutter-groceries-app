import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final String imageAsset;
  
  
  const CategoryCard({
    Key key, @required this.text, @required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purpleAccent),
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Image.asset(imageAsset),
            Text(text),
          ],
        ),
      ),
    );
  }
}
