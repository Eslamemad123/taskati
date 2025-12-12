import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/core/utils/text%20style.dart';

class Dark_Them {
  static get darkTheme => ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: Text_style.getSmall(
        color: const Color.fromARGB(255, 212, 202, 202),
      ),

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
    scaffoldBackgroundColor: App_Color.black,
    appBarTheme: AppBarTheme(backgroundColor: App_Color.black),
    colorScheme: ColorScheme.fromSeed(
      seedColor: App_Color.PrimaryColorBlue,
      onSurface: App_Color.white,
    ),
    datePickerTheme: DatePickerThemeData(backgroundColor: Colors.black),
  
  );
}
