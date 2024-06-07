import 'package:dokan/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../../../common/presentation/widgets/app_text.dart';

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
          child: const AppText(
            title: 'Already have an account?',
            fontSize: 17.36,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.15782825648784637,
            fontColor: Color(0xFF383C40),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(8.94),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/sign_in_page');
          },
          child: const AppText(
            title: 'Login',
            fontSize: 17.36,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            fontColor: Color(0xFF2893E3),
          ),
        ),
      ],
    );
  }
}
