import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app%20color.dart';

class Light_Them {
  static get lightTheme => ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: const Color.fromARGB(255, 131, 129, 129)),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: App_Color.PrimaryColorBlue),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: App_Color.PrimaryColorBlue),
        borderRadius: BorderRadius.circular(10),
      ),

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    fontFamily: 'Poppins',
    scaffoldBackgroundColor: App_Color.white,
    appBarTheme: AppBarTheme(backgroundColor: App_Color.white),
    colorScheme: ColorScheme.fromSeed(
      seedColor: App_Color.PrimaryColorBlue,
      onSurface: App_Color.black,
    ),
    hintColor: App_Color.grey,
  );
}
