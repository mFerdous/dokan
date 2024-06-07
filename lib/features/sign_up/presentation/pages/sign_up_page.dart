import 'package:dokan/features/common/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';
import '../../../common/presentation/widgets/app_text_field.dart';
import '../widgets/already_user_login_widget.dart';
import '../widgets/profile_image_widget.dart';
import '../widgets/social_sign_up_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
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
                  height: getProportionateScreenHeight(52.78),
                ),
                const ProfileImageWidget(),
                SizedBox(
                  height: getProportionateScreenHeight(52.78),
                ),
                _buildNameTextField(),
                SizedBox(
                  height: getProportionateScreenHeight(19.44),
                ),
                _buildEmailTextField(),
                SizedBox(
                  height: getProportionateScreenHeight(19.44),
                ),
                _buildPasswordTextField(),
                SizedBox(
                  height: getProportionateScreenHeight(19.44),
                ),
                _buildConfirmPasswordTextField(),
                SizedBox(
                  height: getProportionateScreenHeight(78.14),
                ),
                AppButton(
                  title: 'Sign Up',
                  width: 308.68,
                  height: 61.11,
                  color: const Color(0xFFF75F55),
                  onTap: () {
                    Navigator.pushNamed(context, '/sign_in_page');
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(39.89),
                ),
                const SocialSignUp(),
                SizedBox(
                  height: getProportionateScreenHeight(52.43),
                ),
                const AlreadyUserLogin(),
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

  Widget _buildNameTextField() {
    return const AppTextField(
      labelText: 'Name',
      prefixIconAssetPath: 'assets/images/person.svg',
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      cursorHeight: 20.35,
      fontSize: 17.36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15782825648784637,
    );
  }

  Widget _buildEmailTextField() {
    return const AppTextField(
      labelText: 'Email',
      prefixIconAssetPath: 'assets/images/email.svg',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorHeight: 20.35,
      fontSize: 17.36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15782825648784637,
    );
  }

  Widget _buildPasswordTextField() {
    return const AppTextField(
      labelText: 'Password',
      prefixIconAssetPath: 'assets/images/lock.svg',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      cursorHeight: 20.35,
      obscureText: true,
      fontSize: 17.36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15782825648784637,
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return const AppTextField(
      labelText: 'Confirm Password',
      prefixIconAssetPath: 'assets/images/lock.svg',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      cursorHeight: 20.35,
      obscureText: true,
      fontSize: 17.36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15782825648784637,
    );
  }
}
