import 'package:flutter/material.dart';
import 'package:winkels_customer/core/app_colors.dart';
import 'package:winkels_customer/ui/login/login_page.dart';
import 'package:winkels_customer/ui/vendor/product_list_page.dart';
import 'package:winkels_customer/ui/welcome/welcome_page.dart';

void main() {
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
      home: ProductListPage(),
    );
  }
}
