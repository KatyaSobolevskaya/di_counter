import 'package:di_counter/presentation/pages/calculation/calculation_page.dart';
import 'package:di_counter/presentation/pages/home/home_controller.dart';
import 'package:di_counter/presentation/pages/home/widgets/bottom_bar.dart';
import 'package:di_counter/presentation/pages/recipes/recipes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController _controller = Get.find<HomeController>();

  static const List<Widget> _widgetOptions = <Widget>[
    CalculationPage(),
    RecipesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _widgetOptions[_controller.currentTab.value],
            ),
            BottomBar(
              onIconPressed: _controller.onItemTapped,
            ),
          ],
        ),
      );
    });
  }
}
