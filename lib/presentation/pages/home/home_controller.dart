import 'package:di_counter/presentation/pages/home/home_tabs.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<HomeTabs> currentTab = HomeTabs.calculation.obs;

  void onIconPressed(HomeTabs tab) {
    currentTab.value = tab;
  }
}
