import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/size_config.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final String prefixIconAssetPath;
  final String? suffixIconAssetPath;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final double cursorHeight;
  final bool obscureText;
  final TextStyle textStyle;

  const AppTextField({
    super.key,
    required this.labelText,
    required this.prefixIconAssetPath,
    this.suffixIconAssetPath,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.cursorHeight = 20.0,
    this.obscureText = false,
    this.textStyle = const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 17.36,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0.15782825648784637,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(308.68),
      height: getProportionateScreenHeight(61.11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A395AB8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        cursorHeight: cursorHeight,
        obscureText: obscureText,
        style: textStyle,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: getProportionateScreenWidth(17.86),
              height: getProportionateScreenHeight(22.32),
              child: SvgPicture.asset(
                prefixIconAssetPath,
                color: const Color(0xFF7C8592),
              ),
            ),
          ),
          suffixIcon: suffixIconAssetPath != null
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: getProportionateScreenWidth(17.86),
                    height: getProportionateScreenHeight(22.32),
                    child: SvgPicture.asset(
                      suffixIconAssetPath!,
                      color: const Color(0xFF7C8592),
                    ),
                  ),
                )
              : null,
          labelText: labelText,
          labelStyle: GoogleFonts.getFont(
            'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 17.4,
            letterSpacing: 0.2,
            color: const Color(0xFFA4A9AF),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
