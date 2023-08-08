import 'package:di_counter/domain/entities/dish.dart';
import 'package:di_counter/domain/entities/product.dart';
import 'package:get/get.dart';

class CalculationController extends GetxController {
  Rx<Dish> dish = Dish(
    products: [Product(id: 0, name: '', calories: 0)],
    id: 0,
    name: 'dish name',
    calories: 0,
    weightBefore: 0,
    weightAfter: 0,
    userId: 0,
  ).obs;
}
