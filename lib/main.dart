import 'package:cubetimer/pages/main_menu/main_menu_page.dart';
import 'package:cubetimer/utils/localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cube Timer',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.brown[300],
        textTheme: GoogleFonts.gentiumBookBasicTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      translations: Localization(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      home: MainMenuPage(),
    );
  }
}
