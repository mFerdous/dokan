
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/size_config.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            // Handle Facebook login
          },
          child: Container(
            width: getProportionateScreenWidth(56),
            height: getProportionateScreenHeight(56),
            padding: const EdgeInsets.symmetric(
              vertical: 16.55,
              horizontal: 22,
            ),
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A395AB8),
                    offset: Offset(0, 3),
                    blurRadius: 2,
                  ),
                ]),
            child: SvgPicture.asset(
              'assets/images/facebook_icon.svg',
            ),
          ),
        ),
        const SizedBox(width: 14),
        InkWell(
          onTap: () {},
          child: Container(
            width: getProportionateScreenWidth(56),
            height: getProportionateScreenHeight(56),
            padding: const EdgeInsets.symmetric(
              vertical: 16.55,
              horizontal: 16.55,
            ),
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A395AB8),
                    offset: Offset(0, 3),
                    blurRadius: 2,
                  ),
                ]),
            child: Image.asset(
              'assets/images/google_icon.png',
            ),
          ),
        ),
      ],
    );
  }
}
