import 'package:di_counter/domain/entities/dish.dart';
import 'package:get/get.dart';

class CalculationController extends GetxController {
  Rx<int> result = 0.obs;
  Rx<int> weightBefore = 0.obs;
  Rx<int> weightAfter = 0.obs;
  RxList<Product> products = <Product>[
    Product(name: '', calories: 0),
  ].obs;
}
