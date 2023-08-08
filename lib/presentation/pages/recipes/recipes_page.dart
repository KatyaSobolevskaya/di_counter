import 'package:di_counter/domain/entities/dish.dart';
import 'package:di_counter/presentation/app/localisation/strings_consts.dart';
import 'package:di_counter/presentation/pages/recipes/recipes_controller.dart';
import 'package:di_counter/presentation/theme/di_counter_theme.dart';
import 'package:di_counter/presentation/theme/theme_extension.dart';
import 'package:di_counter/presentation/utils/consts/di_counter_dimensions.dart';
import 'package:di_counter/presentation/widgets/di_counter_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';

class RecipesPage extends StatelessWidget {
  RecipesPage({super.key});

  final RecipesController _controller = Get.find<RecipesController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.theme.secondaryBackgroundColor,
                context.theme.primaryBackgroundColor,
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(Dimensions.averagePadding),
          child: Column(
            children: [
              _Search(searchedDishes: _controller.searchedDishes),
              Expanded(
                child: ListView.builder(
                    itemCount: _controller.dishes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _DishItem(dish: _controller.dishes[index]);
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Search extends StatelessWidget {
  final List<Dish> searchedDishes;

  const _Search({Key? key, required this.searchedDishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      barHintText: StringsConsts.search.tr,
      barHintStyle: MaterialStateProperty.all(context.theme.baseLight),
      barTrailing: [
        Icon(
          Icons.search_rounded,
          color: context.theme.secondaryIconColor,
        ),
      ],
      barLeading: const SizedBox.shrink(),
      viewLeading: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: context.theme.primaryIconColor,
      ),
      viewTrailing: [
        Icon(
          Icons.clear_rounded,
          color: context.theme.primaryIconColor,
        ),
      ],
      viewBackgroundColor: context.theme.primaryBackgroundColor,
      viewHeaderHintStyle: context.theme.base,
      viewHeaderTextStyle: context.theme.base,
      barElevation: MaterialStateProperty.all(0),
      barBackgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      barShape: MaterialStateProperty.all<OutlinedBorder>(
        LinearBorder(
          bottom: const LinearBorderEdge(),
          side: BorderSide(
            color: context.theme.dividerColor,
            width: Dimensions.dividerThickness,
          ),
        ),
      ),
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return searchedDishes
            .map((dish) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.averagePadding,
                  ),
                  child: _DishItem(
                    dish: dish,
                    inSearchView: true,
                  ),
                ))
            .toList();
      },
    );
  }
}

class _DishItem extends StatelessWidget {
  final Dish dish;
  final bool inSearchView;

  const _DishItem({
    Key? key,
    required this.dish,
    this.inSearchView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle =
        inSearchView ? context.theme.base : context.theme.baseLight;
    return SizedBox(
      height: Dimensions.averageHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dish.name,
                style: textStyle,
              ),
              Text(
                '${dish.calories} ${StringsConsts.calories.tr}',
                style: textStyle,
              ),
            ],
          ),
          inSearchView
              ? DiCounterDivider.secondary(context)
              : DiCounterDivider.main(context),
        ],
      ),
    );
  }
}
