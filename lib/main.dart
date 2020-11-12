import 'package:flutter/material.dart';
import 'package:winkels_customer/core/app_colors.dart';
import 'package:winkels_customer/ui/screens/phone_number_page.dart';
import 'package:winkels_customer/ui/screens/select_location_page.dart';
import 'package:winkels_customer/ui/screens/sing_in_page.dart';
import 'package:winkels_customer/ui/screens/verification_code.dart';
import 'package:winkels_customer/ui/welcome/splash.dart';
import 'package:winkels_customer/ui/welcome/welcome_page.dart';

import 'core/di/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //all widgets are rendered here
  // await EnvironmentConfiguration.run(); // Init env configuration
  await AppModule.initialise(); // Inject modules
  // await Firebase.initializeApp(); // Init Firebase

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
      child: MaterialApp(
        title: 'Winkels',
        darkTheme: darkTheme,
        theme: lightTheme,
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => SingInPage(),
          // '/': (BuildContext context) => WelcomePage(),
          '/phone_number': (BuildContext context) => PhoneNumberPage(),
          // '/welcome': (BuildContext context) => WelcomePage(),
        },
      ),
    );
  }
}
