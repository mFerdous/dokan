import 'package:dokan/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
    // errorMaxLines: 3,
    prefixIconColor: secondaryTextLight,
    suffixIconColor: secondaryTextLight,
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textFieldFontLight,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textFieldFontLight,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textFieldFontLight,
    ),
    border: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: textFieldSelectedLight,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: danger,
      ),
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: danger,
      ),
    ),
  );

  static InputDecorationTheme inputDecorationThemeDark = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: secondaryTextLight,
    suffixIconColor: secondaryTextLight,
    labelStyle: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: textFieldFontLight,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: textFieldFontLight,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: textFieldFontLight,
    ),
    border: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: textFieldBorderLight,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: textFieldSelectedLight,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: danger,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(
        width: 1,
        color: danger,
      ),
    ),
  );
}
