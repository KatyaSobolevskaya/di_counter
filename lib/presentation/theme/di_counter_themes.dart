import 'package:di_counter/presentation/theme/di_counter_theme.dart';
import 'package:flutter/material.dart';

const _beige = Color(0xFFFCF7F6);
const _quartz = Color(0xFFE9E5F6);
const _lavender = Color(0xFFDFBFF2);
const _lavenderBlue = Color(0xFFBDB0F1);
const _blueMarguerite = Color(0xFF6754B1);
const _blueGem = Color(0xFF4A3699);

const lightTheme =DiCounterTheme(
  primaryBackgroundColor:_beige,
  secondaryBackgroundColor:_lavenderBlue,
  primaryButtonColor:_lavenderBlue,
  gradientButtonColor:_lavender,
  primaryTextColor:_blueGem,
  secondaryTextColor:_beige,
  primaryIconColor:_blueMarguerite,
  secondaryIconColor:_beige,
  dividerColor:_beige,
  tableDividerColor:_quartz,
);