import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primaryColor: Color(0xff02A0CF),
    primaryColorBrightness: Brightness.light,
    primaryColorLight: Color(0x1aF5E0C3),
    primaryColorDark: Color(0xff936F3E),
    accentColor: Color(0xff457BE0),
    accentColorBrightness: Brightness.light,
    bottomAppBarColor: Color(0xff6D42CE),
    appBarTheme: AppBarTheme(color: Colors.white),
    cardColor: Color(0xaaF5E0C3),
    dividerColor: Color(0x1f6D42CE),
    focusColor: Color(0x1aF5E0C3)
);

ThemeData darkTheme = ThemeData.dark().copyWith(
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primaryColor: Color(0xff02A0CF),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Color(0x1a311F06),
    primaryColorDark: Color(0xff936F3E),
    accentColor: Color(0xff457BE0),
    accentColorBrightness: Brightness.dark,
    bottomAppBarColor: Color(0xff6D42CE),
    cardColor: Color(0xaa311F06),
    dividerColor: Color(0x1f6D42CE),
    focusColor: Color(0x1a311F06)
);
