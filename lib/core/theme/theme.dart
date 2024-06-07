import 'package:dokan/core/constants/colors.dart';
import 'package:dokan/core/theme/custom_theme/appbar_theme.dart';
import 'package:dokan/core/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:dokan/core/theme/custom_theme/elevated_button_theme.dart';
import 'package:dokan/core/theme/custom_theme/text_field_theme.dart';
import 'package:dokan/core/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    textTheme: TTextTheme.lightTexTheme,
    elevatedButtonTheme: TElevatedButtonTheme.elevatedButtonThemeLight,
    appBarTheme: TAppbarTheme.appBarThemeLight,
    bottomSheetTheme: TBottomSheet.bottomSheetThemeDataLight,
    inputDecorationTheme: TTextFieldTheme.inputDecorationThemeLight,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    textTheme: TTextTheme.lightTexTheme,
    elevatedButtonTheme: TElevatedButtonTheme.elevatedButtonThemeLight,
    appBarTheme: TAppbarTheme.appBarThemeLight,
    bottomSheetTheme: TBottomSheet.bottomSheetThemeDataLight,
    inputDecorationTheme: TTextFieldTheme.inputDecorationThemeLight,
  );
}
