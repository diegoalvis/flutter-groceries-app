import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:winkels_customer/data/models/City.dart';
import 'package:winkels_customer/ui/address/select_address_page.dart';
import 'package:winkels_customer/ui/cart/cart_model.dart';
import 'package:winkels_customer/ui/home/home_cubit.dart';

import 'destination.dart';
import 'destination_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final _cubit = HomeCubit(GetIt.I.get());

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentAddress = _cubit.getCurrentAddress();
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset('assets/icons/app_icon.png'),
          ),
          title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectAddressPage(
                      currentCity: City(
                        currentAddress.cityName,
                        currentAddress.cityCode,
                        currentAddress.countryCode,
                      ),
                    ),
                  ));
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 10),
                Text('${currentAddress.address}, ${currentAddress.cityName}', style: TextStyle(color: Colors.black54)),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black45,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  Icon(destination.icon),
                  Consumer<CartModel>(
                    builder: (context, cart, child) {
                      if (cart.items.isNotEmpty && destination.route == '/my_cart')
                        return Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Container(
                            margin: EdgeInsets.only(left: 2),
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                            alignment: Alignment.center,
                            child: SizedBox(),
                          ),
                        );
                      else {
                        return SizedBox();
                      }
                    },
                  ),
                ],
              ),
              backgroundColor: destination.color,
              label: destination.title);
        }).toList(),
      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return DestinationView(
                destination: destination,
                onChangeCurrentPage: (String route) {
                  final nextIndex = allDestinations.indexWhere((Destination element) => element.route == route);
                  if (nextIndex >= 0) {
                    setState(() {
                      _currentIndex = nextIndex;
                    });
                  }
                });
          }).toList(),
        ),
      ),
    );
  }
}
