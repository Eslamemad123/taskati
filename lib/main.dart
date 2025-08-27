import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/Thems/dark%20them.dart';
import 'package:taskati/core/Thems/light%20them.dart';
import 'package:taskati/core/services/helpel.dart';
import 'package:taskati/core/utils/app%20color.dart';
import 'package:taskati/features/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Local_Helper.inait();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  bool isdark = Local_Helper.getUserData(Local_Helper.KeyisDark) ?? false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Local_Helper.userBox.listenable(),
      builder: (context, box, ciled) {
          bool isdark = Local_Helper.getUserData(Local_Helper.KeyisDark) ?? false;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: isdark ? ThemeMode.light : ThemeMode.dark,
          theme: Light_Them.lightTheme,
          darkTheme: Dark_Them.darkTheme,
          home: Splash_Screen(),
        );
      },
    );
  }
}
