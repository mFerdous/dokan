import 'package:dokan/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlreadyUserLogin extends StatelessWidget {
  const AlreadyUserLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(21),
          child: Text(
            'Already have an account?',
            style: GoogleFonts.getFont(
              'Roboto',
              fontWeight: FontWeight.w300,
              fontSize: 17.36,
              letterSpacing: 0.15782825648784637,
              color: const Color(0xFF383C40),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(8.94),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Login',
            style: GoogleFonts.getFont(
              'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 17.36,
              letterSpacing: 0.2,
              color: const Color(0xFF2893E3),
            ),
          ),
        ),
      ],
    );
  }
}
