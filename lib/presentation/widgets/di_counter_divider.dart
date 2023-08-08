import 'package:di_counter/presentation/theme/theme_extension.dart';
import 'package:di_counter/presentation/utils/consts/di_counter_dimensions.dart';
import 'package:flutter/material.dart';

class DiCounterDivider extends StatelessWidget {
  final bool horizontal;
  final Color color;

  DiCounterDivider.secondary(
    BuildContext context, {
    Key? key,
    this.horizontal = true,
  })  : color = context.theme.tableDividerColor,
        super(key: key);

  DiCounterDivider.main(
    BuildContext context, {
    Key? key,
    this.horizontal = true,
  })  : color = context.theme.dividerColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return horizontal
        ? Divider(
            color: color,
            thickness: Dimensions.dividerThickness,
            height: Dimensions.dividerThickness,
          )
        : VerticalDivider(
            color: color,
            thickness: Dimensions.dividerThickness,
            width: Dimensions.dividerThickness,
          );
  }
}
