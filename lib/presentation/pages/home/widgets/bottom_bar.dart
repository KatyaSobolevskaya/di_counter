import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Function(int) onIconPressed;

  const BottomBar({super.key, required this.onIconPressed});

  static const _icons = [
    Icon(Icons.add_to_photos_outlined),
    Icon(Icons.format_list_bulleted_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      child: Row(
        children: [
          for (int i = 0; i < _icons.length; i++) _iconButton(i),
        ],
      ),
    );
  }

  Widget _iconButton(int index) {
    return IconButton(
      onPressed: onIconPressed(index),
      icon: _icons[index],
    );
  }
}
