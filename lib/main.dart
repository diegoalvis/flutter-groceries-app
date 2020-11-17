import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:winkels_customer/core/app_colors.dart';
import 'package:winkels_customer/ui/address/select_address_page.dart';
import 'package:winkels_customer/ui/cart/cart_page.dart';
import 'package:winkels_customer/ui/home/home_page.dart';
import 'package:winkels_customer/ui/register/phone_number_page.dart';
import 'package:winkels_customer/ui/register/sing_in_page.dart';
import 'package:winkels_customer/ui/vendor/details/vendor_products_page.dart';
import 'package:winkels_customer/ui/welcome/welcome_page.dart';

import 'core/di/app_module.dart';
import 'ui/account/account_page.dart';
import 'ui/cart/cart_model.dart';
import 'ui/register/phone_number_page.dart';
import 'ui/screens/add_new_card_page.dart';
import 'ui/utils/custom_widgets/successful_order_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //all widgets are rendered here
  await AppModule.initialise();
  // await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
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
                '/': (BuildContext context) => WelcomePage(),
                '/phone_number': (BuildContext context) => PhoneNumberPage(),
                '/select_location': (BuildContext context) => SelectAddressPage(),
                '/sing_in': (BuildContext context) => SingInPage(),
                '/select_address': (BuildContext context) => SelectAddressPage(),
                '/home': (BuildContext context) => HomePage(),
                '/successful_order': (BuildContext context) => SuccessfulOrderPage(),
                '/my_cart': (BuildContext context) => CartPage(),
                '/account_page': (BuildContext context) => AccountPage(),
                '/add_new_card_page': (BuildContext context) => AddNewCardPage(),
              },
              onGenerateRoute: (settings) {
                Widget destinationRoute;
                switch (settings.name) {
                  case '/vendor_products':
                    destinationRoute = VendorProductsPage();
                    break;
                  default:
                    destinationRoute = WelcomePage();
                    break;
                }
                return MaterialPageRoute(builder: (context) => destinationRoute, settings: settings);
              },
            );
          }),
    );
  }
}
