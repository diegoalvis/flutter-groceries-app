import 'package:flutter/material.dart';
import 'package:winkels_customer/core/app_colors.dart';
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
    return MaterialApp(
      title: 'Winkels',
      darkTheme: darkTheme,
      theme: lightTheme,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => WelcomePage(),
        // '/welcome': (BuildContext context) => WelcomePage(),
      },
    );
  }
}
