import 'package:di_counter/presentation/theme/theme_extension.dart';
import 'package:di_counter/presentation/utils/consts/di_counter_dimensions.dart';
import 'package:flutter/material.dart';

class DiCounterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const DiCounterButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(Dimensions.smallHeight),
        backgroundColor: context.theme.primaryButtonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimensions.averageRadius),
          ),
        ),
      ),
      child: child,
    );
  }
}
