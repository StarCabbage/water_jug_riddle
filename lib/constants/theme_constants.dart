import 'package:flutter/material.dart';

abstract class ConstantsTheme {
  static const MaterialColor primarySwatch = Colors.grey;
  static ThemeData primaryTheme = ThemeData(primarySwatch: primarySwatch);

  static const double kXSpacer = .5;

  static const double kSpacing = 16;
  static const double kSpacingX05 = kSpacing / 2;

  static OutlinedBorder roundShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
}
