import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;

  const SearchTextField({Key key, @required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        fillColor: Color(0xFFF2F2F2),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
        prefixIcon: Icon(Icons.search),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
