import 'package:di_counter/presentation/theme/di_counter_theme.dart';
import 'package:di_counter/presentation/theme/theme_provider.dart';
import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  DiCounterTheme get theme => ThemeProvider.of(this).theme;
}
