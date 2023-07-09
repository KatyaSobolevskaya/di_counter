import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<int> currentTab = 0.obs;

  void onItemTapped(int index) {
    currentTab.value = index;
  }}