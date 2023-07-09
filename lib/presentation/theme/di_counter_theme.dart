import 'package:di_counter/presentation/utils/app_fonts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DiCounterTheme extends Equatable {
  final Color primaryBackgroundColor;
  final Color secondaryBackgroundColor;

  final Color gradientButtonColor;
  final Color primaryButtonColor;

  final Color primaryTextColor;
  final Color secondaryTextColor;

  final Color primaryIconColor;
  final Color secondaryIconColor;

  final Color dividerColor;
  final Color tableDividerColor;

  const DiCounterTheme({
    required this.primaryBackgroundColor,
    required this.secondaryBackgroundColor,
    required this.primaryButtonColor,
    required this.gradientButtonColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.primaryIconColor,
    required this.secondaryIconColor,
    required this.dividerColor,
    required this.tableDividerColor,
  });

  @override
  List<Object?> get props => [
        primaryBackgroundColor,
        secondaryBackgroundColor,
        primaryButtonColor,
        gradientButtonColor,
        primaryTextColor,
        secondaryTextColor,
        primaryIconColor,
        secondaryIconColor,
        dividerColor,
        tableDividerColor,
      ];
}

extension TextStylesExtensions on DiCounterTheme {
  TextStyle get base => TextStyle(
        color: primaryTextColor,
        fontSize: DiCounterFonts.sizeMedium,
        fontWeight: DiCounterFonts.weightRegular,
      );

  TextStyle get baseLight => TextStyle(
        color: secondaryTextColor,
        fontSize: DiCounterFonts.sizeMedium,
        fontWeight: DiCounterFonts.weightRegular,
      );

  TextStyle get title => TextStyle(
        color: secondaryTextColor,
        fontSize: DiCounterFonts.sizeMedium,
        fontWeight: DiCounterFonts.weightBold,
      );

  TextStyle get titleLarge => TextStyle(
    color: secondaryTextColor,
    fontSize: DiCounterFonts.sizeExtraLarge,
    fontWeight: DiCounterFonts.weightBold,
  );
}
