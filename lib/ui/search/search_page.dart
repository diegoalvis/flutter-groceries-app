import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/home/destination.dart';

class SearchPage extends StatelessWidget {
  final Destination destination;
  final Function(String route) onChangeCurrentPage;

  const SearchPage({Key key, this.destination, this.onChangeCurrentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
