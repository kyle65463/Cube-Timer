import 'package:cubetimer/models/settings/options/language.dart';
import 'package:cubetimer/models/settings/settings.dart';
import 'package:cubetimer/pages/main_menu/main_menu_page.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:cubetimer/repositories/database/hive_database.dart';
import 'package:cubetimer/repositories/settings_repository.dart';
import 'package:cubetimer/utils/localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  await Get.put<Database>(HiveDatabase()).init();
  Get.lazyPut<SettingsRepository>(() => SettingsRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Variables
  final SettingsRepository settingsRepository = Get.find<SettingsRepository>();

  // Functions
  @override
  Widget build(BuildContext context) {
    final Settings settings = settingsRepository.loadSettings();
    final Language? language = settings.map[SettingsKeyLanguage()] as Language?;
    return GetMaterialApp(
      title: 'Cube Timer',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.brown[200],
        textTheme: GoogleFonts.gentiumBookBasicTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      translations: Localization(),
      locale: language?.locale ?? Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      home: MainMenuPage(),
    );
  }
}
