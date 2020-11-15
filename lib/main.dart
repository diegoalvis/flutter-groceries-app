import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/core/app_colors.dart';
import 'package:winkels_customer/ui/address/select_address_page.dart';
import 'package:winkels_customer/ui/register/phone_number_page.dart';
import 'package:winkels_customer/ui/register/sing_in_page.dart';
import 'package:winkels_customer/ui/screens/successful_order_page.dart';
import 'package:winkels_customer/ui/welcome/welcome_page.dart';

import 'core/di/app_module.dart';
import 'ui/register/phone_number_page.dart';
import 'ui/screens/account_page.dart';
import 'ui/screens/home_page.dart';
import 'ui/screens/my_car_page.dart';
import 'ui/screens/profile_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //all widgets are rendered here
  await AppModule.initialise(); // Inject modules
  await Firebase.initializeApp(); // Init Firebase

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: FutureBuilder(
          future: GetIt.I.allReady(),
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Winkels',
              darkTheme: darkTheme,
              theme: lightTheme,
              initialRoute: '/',
              routes: {
                '/': (BuildContext context) =>ProfilePage(),
                '/phone_number': (BuildContext context) => PhoneNumberPage(),
                '/select_location': (BuildContext context) => SelectAddressPage(),
                '/sing_in': (BuildContext context) => SingInPage(),
                '/select_address': (BuildContext context) => SelectAddressPage(),
                // '/home': (BuildContext context) => HomePage(),
                '/successful_order': (BuildContext context) => SuccessfulOrderPage(),
                '/my_car': (BuildContext context) => MyCarPage(),
                '/account_page': (BuildContext context) => AccountPage(),

                // '/welcome': (BuildContext context) => WelcomePage(),
              },
            );
          }),
    );
  }
}
