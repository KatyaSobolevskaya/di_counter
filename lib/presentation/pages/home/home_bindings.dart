import 'package:di_counter/presentation/pages/calculation/calculation_controller.dart';
import 'package:di_counter/presentation/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CalculationController());
  }
}
