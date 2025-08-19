import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/features/splash/splash.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
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
      ),
      home: Splash_Screen(),
    );
  }
}
