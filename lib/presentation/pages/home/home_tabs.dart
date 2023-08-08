import 'package:di_counter/presentation/pages/calculation/calculation_page.dart';
import 'package:di_counter/presentation/pages/recipes/recipes_page.dart';
import 'package:flutter/material.dart';

enum HomeTabs {
  calculation,
  recipes,
}

extension HomeTabsExt on HomeTabs {
  Widget get page => switch (this) {
        HomeTabs.calculation => CalculationPage(),
        HomeTabs.recipes => RecipesPage(),
      };

  Icon get icon => switch (this) {
        HomeTabs.calculation => const Icon(Icons.add_to_photos_outlined),
        HomeTabs.recipes => const Icon(Icons.format_list_bulleted_rounded),
      };
}
