import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/account/account_page.dart';
import 'package:winkels_customer/ui/cart/cart_page.dart';
import 'package:winkels_customer/ui/search/search_page.dart';
import 'package:winkels_customer/ui/vendor/list/vendor_list_page.dart';

import 'destination.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination, this.onChangeCurrentPage}) : super(key: key);

  final Destination destination;
  final Function(String route) onChangeCurrentPage;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    switch (widget.destination.route) {
      case '/vendor_list':
        return VendorListPage(destination: widget.destination, onChangeCurrentPage: widget.onChangeCurrentPage);
      case '/search':
        return SearchPage(destination: widget.destination, onChangeCurrentPage: widget.onChangeCurrentPage);
      case '/my_cart':
        return CartPage(destination: widget.destination, onChangeCurrentPage: widget.onChangeCurrentPage);
      case '/account':
        return AccountPage(destination: widget.destination, onChangeCurrentPage: widget.onChangeCurrentPage);
      default:
        return VendorListPage(destination: widget.destination, onChangeCurrentPage: widget.onChangeCurrentPage);
    }
  }
}
