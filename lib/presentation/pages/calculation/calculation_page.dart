import 'package:di_counter/domain/entities/dish.dart';
import 'package:di_counter/presentation/app/localisation/strings_consts.dart';
import 'package:di_counter/presentation/pages/calculation/calculation_controller.dart';
import 'package:di_counter/presentation/theme/di_counter_theme.dart';
import 'package:di_counter/presentation/theme/theme_extension.dart';
import 'package:di_counter/presentation/utils/consts/di_counter_dimensions.dart';
import 'package:di_counter/presentation/widgets/di_counter_button.dart';
import 'package:di_counter/presentation/widgets/di_counter_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';

class CalculationPage extends StatelessWidget {
  CalculationPage({super.key});

  final CalculationController _controller = Get.find<CalculationController>();

  @override
  Widget build(BuildContext context) {
    final mainBlockHeights = MediaQuery.of(context).size.height * 0.7;
    return Obx(() {
      return Container(
        color: context.theme.primaryIconColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(Dimensions.averagePadding),
              height: mainBlockHeights,
              decoration: BoxDecoration(
                color: context.theme.primaryBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(Dimensions.bigRadius),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.averagePadding),
                  Row(
                    children: [
                      _Weight(
                        title: StringsConsts.weightBefore.tr,
                        value: _controller.weightBefore.value,
                      ),
                      const SizedBox(width: Dimensions.averagePadding),
                      _Weight(
                        title: StringsConsts.weightAfter.tr,
                        value: _controller.weightAfter.value,
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.averagePadding),
                  _Table(
                    products: _controller.products,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DiCounterButton(
                          onPressed: () {},
                          child: Text(
                            StringsConsts.save.tr,
                            style: context.theme.title,
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimensions.averagePadding),
                      DiCounterButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ),
            _Result(result: _controller.result.value),
          ],
        ),
      );
    });
  }
}

class _Weight extends StatelessWidget {
  final String title;
  final int value;

  const _Weight({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.textPadding,
              vertical: Dimensions.smallTextPadding,
            ),
            child: Text(title, style: context.theme.base),
          ),
          Container(
            height: Dimensions.smallHeight,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.textPadding,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(Dimensions.averageRadius),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0, 0.8],
                colors: [
                  context.theme.gradientButtonColor,
                  context.theme.primaryButtonColor,
                ],
                transform: const GradientRotation(0.9),
              ),
            ),
            child: TextFormField(
              initialValue: '0',
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              style: context.theme.title,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixStyle: context.theme.title,
                suffixText: StringsConsts.grams.tr,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Table extends StatelessWidget {
  final List<Product> products;

  const _Table({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: Dimensions.averageHeight,
            decoration: BoxDecoration(
              color: context.theme.primaryButtonColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(Dimensions.averageRadius),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: Dimensions.textPadding),
                  child:
                      Text(StringsConsts.name.tr, style: context.theme.title),
                ),
                SizedBox(
                  width: Dimensions.ceilWidth,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: Dimensions.textPadding),
                    child: Text(
                      StringsConsts.calories.tr,
                      style: context.theme.title,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, int i) => _ProductItem(
                product: products[i],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final Product product;

  const _ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.averageHeight,
      child: Column(
        children: [
          const DiCounterDivider(),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: Dimensions.textPadding),
                  child: TextFormField(
                    initialValue: product.name,
                    style: context.theme.base,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: Dimensions.dividerHeight,
                  child: DiCounterDivider(horizontal: false)),
              SizedBox(
                width: Dimensions.ceilWidth,
                child: Padding(
                  padding: const EdgeInsets.only(left: Dimensions.textPadding),
                  child: TextFormField(
                    initialValue: '${product.calories}',
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: context.theme.base,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Result extends StatelessWidget {
  final int result;

  const _Result({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.averagePadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringsConsts.result.tr,
              style: context.theme.title,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '$result',
                style: context.theme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
