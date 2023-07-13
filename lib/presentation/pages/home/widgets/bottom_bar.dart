import 'package:di_counter/presentation/pages/home/home_tabs.dart';
import 'package:di_counter/presentation/theme/theme_extension.dart';
import 'package:di_counter/presentation/utils/consts/di_counter_dimensions.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Function(HomeTabs) onIconPressed;
  final HomeTabs currentTab;

  const BottomBar({
    super.key,
    required this.onIconPressed,
    required this.currentTab,
  });

  @override
  Widget build(BuildContext context) {
    final buttons = [
      for (final tab in HomeTabs.values)
        _IconButton(
          onPressed: () => onIconPressed(tab),
          icon: tab.icon,
          iconColor: tab.icon == currentTab.icon
              ? context.theme.primaryIconColor
              : context.theme.secondaryIconColor,
        ),
    ];
    return Container(
      height: 57,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.mainPadding),
      color: context.theme.secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buttons,
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final Color iconColor;

  const _IconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      onPressed: onPressed,
      icon: icon,
      color: iconColor,
    );
  }
}
