import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/size_config.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String prefixIconAssetPath;
  final String? suffixIconAssetPath;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final double cursorHeight;
  final bool obscureText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final double? letterSpacing;

  const AppTextField({
    super.key,
    this.labelText,
    this.hintText,
    required this.prefixIconAssetPath,
    this.suffixIconAssetPath,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.cursorHeight = 20.0,
    this.obscureText = false,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.letterSpacing,
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
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: fontSize ?? 17.36,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: height ?? 1,
          letterSpacing: letterSpacing ?? 0.15782825648784637,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: getProportionateScreenWidth(17.86),
              height: getProportionateScreenHeight(22.32),
              child: SvgPicture.asset(
                prefixIconAssetPath,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF7C8592),
                  BlendMode.srcIn,
                ),
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
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF7C8592),
                        BlendMode.srcIn,
                      ),
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
          hintText: hintText,
          hintStyle: GoogleFonts.getFont(
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
