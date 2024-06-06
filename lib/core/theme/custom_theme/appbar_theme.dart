
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TAppbarTheme {
  TAppbarTheme._();

  static const appBarThemeLight = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: light,
      iconTheme: IconThemeData(color: dark),
      actionsIconTheme: IconThemeData(color: dark),
      titleTextStyle:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: dark));

  static const appBarThemeDark = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: light,
      iconTheme: IconThemeData(color: dark),
      actionsIconTheme: IconThemeData(color: dark),
      titleTextStyle:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: dark));
}
