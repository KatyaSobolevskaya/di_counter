import 'package:di_counter/presentation/pages/home/home_controller.dart';
import 'package:di_counter/presentation/pages/home/home_tabs.dart';
import 'package:di_counter/presentation/pages/home/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Expanded(
                child: _controller.currentTab.value.page,
              ),
              BottomBar(
                onIconPressed: _controller.onIconPressed,
                currentTab: _controller.currentTab.value,
              ),
            ],
          ),
        ),
      );
    });
  }
}
