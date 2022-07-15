import 'package:flutter/material.dart';

class ThemeApp {
  static const colorBase = Colors.green;

  static final themeAppBar = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
    appBarTheme: const AppBarTheme(
      color: colorBase,
      elevation: 0,
    ),

    //TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: colorBase,
          textStyle: const TextStyle(
            fontSize: 20,
          )),
    ),
    //ElevatedButton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: colorBase,
      ),
    ),

    //FloatActionButton Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: colorBase,
    ),
  );

  static final themeAppBarOscuro = ThemeData.dark().copyWith(
    primaryColor: Colors.indigo,
    appBarTheme: const AppBarTheme(
      color: colorBase,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.black87,
  );
}
