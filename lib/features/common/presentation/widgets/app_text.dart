import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/lang/app_localizations.dart';

class AppText extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final Color? fontColor;

  const AppText({
    super.key,
    required this.title,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate(title),
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.getFont(
        'Roboto',
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: letterSpacing ?? 0,
        color: fontColor ?? const Color(0xFF000000),
      ),
    );
  }
}
