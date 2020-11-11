import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/data/preferences/preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () => loadData());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadData() async {
    Future.delayed(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    final Preferences pref = await GetIt.I.getAsync<Preferences>();
    Navigator.popAndPushNamed(context, pref.getProfile() == null ? '/welcome' : '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Splash")),
    );
  }
}
