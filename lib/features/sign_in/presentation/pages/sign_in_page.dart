import 'package:dokan/features/common/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/size_config.dart';
import '../../../common/presentation/widgets/app_text_field.dart';
import '../widget/social_sign_in_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
  });

  @override
  State<SignInPage> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8F8F8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(83.05),
                ),
                SvgPicture.asset('assets/images/dokan_logo.svg'),
                SizedBox(
                  height: getProportionateScreenHeight(83.15),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(1.2, 0, 0, 41),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                _buildEmailTextField(),
                SizedBox(
                  height: getProportionateScreenHeight(19.44),
                ),
                _buildPasswordTextField(),
                SizedBox(
                  height: getProportionateScreenHeight(18.33),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(1.4, 0, 1.4, 60.7),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        letterSpacing: 0.1,
                        color: Color(0xFFA4A9AF),
                      ),
                    ),
                  ),
                ),
                AppButton(
                  title: 'Sign In',
                  width: 308.68,
                  height: 61.11,
                  color: const Color(0xFFF75F55),
                  onTap: () {},
                ),
                SizedBox(
                  height: getProportionateScreenHeight(39.89),
                ),
                const SocialSignIn(),
                SizedBox(
                  height: getProportionateScreenHeight(52.22),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(21),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Create New Account',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w300,
                        fontSize: 17.36,
                        letterSpacing: 0.15782825648784637,
                        color: const Color(0xFF383C40),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(54.57),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return const AppTextField(
      labelText: 'Email',
      prefixIconAssetPath: 'assets/images/email.svg',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorHeight: 20.35,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 17.36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15782825648784637,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return const AppTextField(
      labelText: 'Password',
      prefixIconAssetPath: 'assets/images/lock.svg',
      suffixIconAssetPath: 'assets/images/eye_off.svg',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorHeight: 20.35,
      obscureText: true,
      textStyle: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 17.36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15782825648784637,
      ),
    );
  }
}
