import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/data/models/City.dart';
import 'package:winkels_customer/ui/address/select_address_page.dart';
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
            Text('${currentAddress.address}, ${currentAddress.cityName}', style: TextStyle(color: Theme.of(context).primaryColor)),
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
          return BottomNavigationBarItem(icon: Icon(destination.icon), backgroundColor: destination.color, label: destination.title);
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
