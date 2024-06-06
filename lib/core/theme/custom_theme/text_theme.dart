import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextTheme {
  static TextTheme lightTexTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 36, fontWeight: FontWeight.w700, color: primaryTextLight),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 22, fontWeight: FontWeight.w700, color: primaryTextLight),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.w400, color: primaryTextLight),
    titleLarge: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w700, color: primaryTextLight),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w700, color: primaryTextLight),
    titleSmall: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w700, color: primaryTextLight),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w500, color: primaryTextLight),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w700, color: primaryTextLight),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w400, color: primaryTextLight),
    labelLarge: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w700, color: primaryTextLight),
    labelMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, color: primaryTextLight),
    labelSmall: const TextStyle().copyWith(
        fontSize: 15, fontWeight: FontWeight.w700, color: primaryTextLight),
  );
  static TextTheme darktTexTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 36, fontWeight: FontWeight.w700, color: primaryTextDark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 22, fontWeight: FontWeight.w700, color: primaryTextDark),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w700, color: primaryTextDark),
    titleLarge: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w700, color: primaryTextDark),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w700, color: primaryTextDark),
    titleSmall: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w700, color: primaryTextDark),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w500, color: primaryTextDark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: primaryTextDark),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w600, color: primaryTextDark),
    labelLarge: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w500, color: primaryTextDark),
    labelMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: primaryTextDark),
    labelSmall: const TextStyle().copyWith(
        fontSize: 15, fontWeight: FontWeight.w700, color: primaryTextDark),
  );
}
