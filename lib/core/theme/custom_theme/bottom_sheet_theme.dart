import 'package:dokan/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TBottomSheet {
  TBottomSheet._();

  static BottomSheetThemeData bottomSheetThemeDataLight =
      const BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: light,
    modalBackgroundColor: light,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
    ),
  );

  static BottomSheetThemeData bottomSheetThemeDataDark =
      const BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: dark,
    modalBackgroundColor: dark,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
    ),
  );
}
