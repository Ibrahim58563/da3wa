import 'package:daawa/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: lightPrimaryColor,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
    //   background: Colors.black,
    // ),
    colorScheme: ColorScheme.light(
      primary: lightPrimaryColor,
      secondary: lightSecondaryColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
    //   background: Colors.black,
    // ),
    primaryColor: darkPrimaryColor,
    colorScheme: ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
    ),
  );
}
