import 'dart:developer';

import 'package:dokan/features/common/presentation/widgets/app_button.dart';
import 'package:dokan/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:dokan/features/sign_in/presentation/cubit/sign_in_validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/resources/error_msg_res.dart';
import '../../../../core/utils/formz.dart';
import '../../../../core/utils/size_config.dart';
import '../../../common/presentation/widgets/app_dialog.dart';
import '../../../common/presentation/widgets/app_loading.dart';
import '../../../common/presentation/widgets/app_text.dart';
import '../../../common/presentation/widgets/app_text_field.dart';
import '../widget/social_sign_in_widget.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

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
    return BlocListener<SignInApiCubit, SignInApiState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          showAppLoading(context);
        } else if (state is SignInFailed) {
          log('Fialed');
          Navigator.pop(context);

          final ex = state.exception;
          if (ex is ServerException) {
            Widget html = Html(
              data: ex.message,
            );

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: html,
                );
              },
            );

            // showAppDialog(context, title: ex.message ?? '');
          } else if (ex is NoInternetException) {
            showAppDialog(context, title: ErrorMsgRes.kNoInternet);
          }
        } else if (state is SignInSucceed) {

          Navigator.pushNamed(context, '/landing_page');
        }
      },
      child: Scaffold(
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
                  const AppText(
                    title: 'Sign In',
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontColor: Color(0xFF000000),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(41),
                  ),
                  _buildEmailTextField(),
                  SizedBox(
                    height: getProportionateScreenHeight(19.44),
                  ),
                  _buildPasswordTextField(),
                  SizedBox(
                    height: getProportionateScreenHeight(18.33),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: AppText(
                      title: 'Forgot Password?',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                      fontColor: Color(0xFFA4A9AF),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(60.7),
                  ),
                  _buildSignInButton(),
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
                      onTap: () {
                        Navigator.pushNamed(context, '/sign_up_page');
                      },
                      child: const AppText(
                        title: 'Create New Account',
                        fontSize: 17.36,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.15782825648784637,
                        fontColor: Color(0xFF383C40),
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
      ),
    );
  }

  Widget _buildSignInButton() {
    return BlocBuilder<SignInValidationCubit, SignInValidationState>(
      builder: (context, state) {
        return AppButton(
          title: 'Sign In',
          width: 308.68,
          height: 61.11,
          color: const Color(0xFFF75F55),
          isDisabled: state.status.isInvalid || state.status.isPure,
          onTap: () {
            context.read<SignInValidationCubit>().callSignInApi(context);
          },
        );
      },
    );
  }

  Widget _buildEmailTextField() {
    return BlocBuilder<SignInValidationCubit, SignInValidationState>(
      builder: (context, state) {
        final formz = state.emailId;
        return AppTextField(
          labelText: 'Email',
          prefixIconAssetPath: 'assets/images/email.svg',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorHeight: 20.35,
          fontSize: 17.36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15782825648784637,
          onChange: context.read<SignInValidationCubit>().changeEmailId,
          errorText: formz.status == FormzInputStatus.pure
              ? 'email_id_required'
              : formz.error,
        );
      },
    );
  }

  Widget _buildPasswordTextField() {
    return BlocBuilder<SignInValidationCubit, SignInValidationState>(
      builder: (context, state) {
        final formz = state.password;
        return AppTextField(
          labelText: 'Password',
          prefixIconAssetPath: 'assets/images/lock.svg',
          suffixIconAssetPath: 'assets/images/eye_off.svg',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          cursorHeight: 20.35,
          obscureText: true,
          fontSize: 17.36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15782825648784637,
          onChange: context.read<SignInValidationCubit>().changePassword,
          errorText: formz.status == FormzInputStatus.pure
              ? 'sign-in_pass_req'
              : formz.error,
        );
      },
    );
  }
}
