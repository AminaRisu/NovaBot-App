import 'package:flutter/material.dart';

class FontSizes {
  static const extraSmall = 14.0;
  static const small = 16.0;
  static const standard = 18.0;
  static const large = 20.0;
  static const extraLarge = 24.0;
  static const doubleExtraLarge = 26.0;
}

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.white,
  ),
  colorScheme: const ColorScheme.light(
    surface: Color(0xffffffff),
    primary: Color(0xFF11455B),
    secondary: Color(0xffEEEEEE),
  ),
  inputDecorationTheme:  InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xFF11455B)),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Color(0xff000000),),
    titleSmall: TextStyle(
      color: Color(0xff000000),
    ),
    bodyMedium: TextStyle(
      color: Color(0xffEEEEEE),
      fontSize: FontSizes.small,
    ),
    bodySmall: TextStyle(
      color: Color(0xff000000),
      fontSize: FontSizes.small,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    shadowColor: Color(0xff625b5b),
  ),
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff11455b),
    primary: Color(0xFF11455B),
    secondary: Color(0xffEEEEEE),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black), // Change label color to black for dark mode
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Color.fromARGB(255, 9, 9, 9),),
    titleSmall: TextStyle(
      color: Color(0xff000000),
    ),
    bodyMedium: TextStyle(
      color: Color(0xffEEEEEE),
      fontSize: FontSizes.small,
    ),
    bodySmall: TextStyle(
      color: Color(0xff000000),
      fontSize: FontSizes.small,
    ),
  ),
);
