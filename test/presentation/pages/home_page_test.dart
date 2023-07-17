import 'package:di_counter/presentation/pages/calculation/calculation_controller.dart';
import 'package:di_counter/presentation/pages/home/home_controller.dart';
import 'package:di_counter/presentation/pages/home/home_page.dart';
import 'package:di_counter/presentation/pages/home/home_tabs.dart';
import 'package:di_counter/presentation/theme/di_counter_themes.dart';
import 'package:di_counter/presentation/theme/theme_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.put<HomeController>(HomeController());
    Get.put<CalculationController>(CalculationController());
  });

  tearDown(() {
    Get.delete<HomeController>();
    Get.delete<CalculationController>();
  });

  testWidgets('Changes tabs after tapping on the icons',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ThemeProvider(
        theme: lightTheme,
        child: GetMaterialApp(
          home: HomePage(),
        ),
      ),
    );

    for (final tab in HomeTabs.values) {
      await tester.tap(find.byWidget(tab.icon));
      await tester.pumpAndSettle();
      expect(find.byType(tab.page.runtimeType), findsOneWidget);
    }
  });
}
