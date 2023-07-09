import 'package:di_counter/presentation/theme/di_counter_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  final DiCounterTheme theme;

  const ThemeProvider({Key? key, required Widget child, required this.theme})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) => theme != oldWidget.theme;

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }
}
