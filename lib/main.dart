import 'package:flutter/material.dart';
import 'package:winkels_customer/core/app_colors.dart';
import 'package:winkels_customer/ui/screens/phone_number_page.dart';
import 'package:winkels_customer/ui/screens/select_location_page.dart';
import 'package:winkels_customer/ui/screens/sing_in_page.dart';
import 'package:winkels_customer/ui/screens/verification_code.dart';
import 'package:winkels_customer/ui/welcome/splash.dart';
import 'package:winkels_customer/ui/welcome/welcome_page.dart';

import 'core/di/app_module.dart';
import 'ui/screens/home_page.dart';

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
        debugShowCheckedModeBanner: false,
        title: 'Winkels',
        darkTheme: darkTheme,
        theme: lightTheme,
        initialRoute: '/',
        routes: {
          // '/': (BuildContext context) => WelcomePage(),
          '/': (BuildContext context) => HomePage(),
          '/phone_number': (BuildContext context) => PhoneNumberPage(),
          '/select_location': (BuildContext context) => SelectLocationPage(),
          '/sing_in': (BuildContext context) => SingInPage(),
          '/verification_code': (BuildContext context) => VerificationCodePage(),
          '/home': (BuildContext context) => HomePage(),

          // '/welcome': (BuildContext context) => WelcomePage(),
        },
      ),
    );
  }
}
