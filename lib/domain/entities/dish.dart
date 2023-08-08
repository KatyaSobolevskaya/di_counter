import 'package:di_counter/domain/entities/product.dart';

class Dish {
  final int id;
  final String name;
  final int calories;
  final int weightBefore;
  final int weightAfter;
  final int userId;
  final List<Product> products;

  Dish({
    required this.id,
    required this.name,
    required this.calories,
    required this.weightBefore,
    required this.weightAfter,
    required this.userId,
    required this.products,
  });
}
