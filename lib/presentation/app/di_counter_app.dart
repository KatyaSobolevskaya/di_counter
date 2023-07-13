import 'package:di_counter/presentation/app/localisation/languages.dart';
import 'package:di_counter/presentation/app/navigation/routes.dart';
import 'package:di_counter/presentation/pages/home/home_bindings.dart';
import 'package:di_counter/presentation/pages/home/home_page.dart';
import 'package:di_counter/presentation/theme/di_counter_themes.dart';
import 'package:di_counter/presentation/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiCounterApp extends StatelessWidget {
  const DiCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      theme: lightTheme,
      child: GetMaterialApp(
        translations: Languages(),
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('ru', 'RU'),
        initialRoute: Routes.home,
        getPages: _getPages,
      ),
    );
  }
}

List<GetPage> get _getPages => [
      GetPage(
        name: Routes.home,
        page: HomePage.new,
        bindings: [
          HomeBinding(),
        ],
      ),
    ];
