import 'package:di_counter/domain/entities/dish.dart';
import 'package:get/get.dart';

class RecipesController extends GetxController {
  RxList<Dish> dishes = <Dish>[].obs;
  RxList<Dish> searchedDishes = <Dish>[].obs;
}
