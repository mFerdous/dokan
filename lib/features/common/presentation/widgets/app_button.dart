import 'package:flutter/material.dart';
import 'package:dokan/core/utils/size_config.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utils/lang/app_localizations.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final bool isDisabled;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final Color? fontColor;
  final Color? borderColor;

  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    required this.width,
    required this.height,
    this.isDisabled = false,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.fontColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: getProportionateScreenWidth(width),
        height: getProportionateScreenHeight(height),
        decoration: BoxDecoration(
          color:
              isDisabled ? color ?? primary.withOpacity(0.5) : color ?? primary,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            AppLocalizations.of(context).translate(title),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: fontWeight ?? FontWeight.w500,
              fontSize: fontSize ?? 14,
              color: fontColor ?? Colors.white,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
    );
  }
}
