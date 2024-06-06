import 'package:dokan/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final elevatedButtonThemeLight = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: primary,
      foregroundColor: primaryTextDark,
      disabledBackgroundColor: secondaryTextLight,
      disabledForegroundColor: secondaryTextLight,
      side: const BorderSide(color: primary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: primaryTextDark),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  static final elevatedButtonThemeDark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: primary,
      foregroundColor: primaryTextDark,
      disabledBackgroundColor: secondaryTextLight,
      disabledForegroundColor: secondaryTextLight,
      side: const BorderSide(color: primary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: primaryTextDark),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
