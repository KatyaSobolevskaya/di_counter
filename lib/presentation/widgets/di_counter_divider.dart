import 'package:di_counter/presentation/theme/theme_extension.dart';
import 'package:di_counter/presentation/utils/consts/di_counter_dimensions.dart';
import 'package:flutter/material.dart';

class DiCounterDivider extends StatelessWidget {
  final bool horizontal;

  const DiCounterDivider({
    Key? key,
    this.horizontal = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return horizontal
        ? Divider(
            color: context.theme.tableDividerColor,
            thickness: Dimensions.dividerThickness,
            height: Dimensions.dividerThickness,
          )
        : VerticalDivider(
            color: context.theme.tableDividerColor,
            thickness: Dimensions.dividerThickness,
            width: Dimensions.dividerThickness,
          );
  }
}
