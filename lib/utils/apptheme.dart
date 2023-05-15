import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
      )
    // colorSchemeSeed: Colors.deepPurple,
    // textTheme: TextTheme(
    //   displayMedium: TextStyle(
    //     fontSize: 20,
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
          primary: Colors.purple
      )
    // colorSchemeSeed: Colors.white,
    // textTheme: TextTheme(
    //   displayMedium: TextStyle(
    //     fontSize: 20,
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
  );
}