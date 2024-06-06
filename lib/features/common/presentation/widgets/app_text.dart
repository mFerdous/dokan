import 'package:flutter/material.dart';

import '../../../../core/utils/lang/app_localizations.dart';

class AppText extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final double? fontSize;
  final String fontColor;

  const AppText({
    Key? key,
    required this.title,
    this.textAlign,
    this.fontSize,
    required this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate(title),
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        color: Color(int.parse(fontColor)),
        fontFamily: 'Urbanist',
      ),
    );
  }
}
