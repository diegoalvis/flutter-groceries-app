import 'package:flutter/material.dart';
import 'package:winkels_customer/ui/account/account_page.dart';
import 'package:winkels_customer/ui/cart/my_cart_page.dart';
import 'package:winkels_customer/ui/search/search_page.dart';
import 'package:winkels_customer/ui/vendor/vendor_list_page.dart';

import 'destination.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (widget.destination.route) {
              case '/vendor_list':
                return VendorListPage(destination: widget.destination);
              case '/search':
                return SearchPage(destination: widget.destination);
              case '/my_cart':
                return MyCartPage(destination: widget.destination);
              case '/account':
                return AccountPage(destination: widget.destination);
              default:
                return VendorListPage(destination: widget.destination);
            }
          },
        );
      },
    );
  }
}
