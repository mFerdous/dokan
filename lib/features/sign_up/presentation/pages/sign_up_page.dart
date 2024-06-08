import 'dart:developer';

import 'package:dokan/features/common/presentation/widgets/app_button.dart';
import 'package:dokan/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:dokan/features/sign_up/presentation/cubit/sign_up_validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/resources/error_msg_res.dart';
import '../../../../core/utils/formz.dart';
import '../../../../core/utils/size_config.dart';
import '../../../common/presentation/widgets/app_dialog.dart';
import '../../../common/presentation/widgets/app_loading.dart';
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
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showAppLoading(context);
        } else if (state is SignUpFailure) {
          log('Fialed');
          Navigator.pop(context);

          final ex = state.exception;
          if (ex is ServerException) {
            // Widget html = Html(
            //   data: ex.message,
            // );

            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     return AlertDialog(
            //       title: html,
            //     );
            //   },
            // );

            showAppDialog(context, title: ex.message ?? '');
          } else if (ex is NoInternetException) {
            showAppDialog(context, title: ErrorMsgRes.kNoInternet);
          }
        } else if (state is SignUpSuccess) {
          Navigator.pushNamed(context, '/sign_in_page');
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                  _buildSignUpButton(),
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
      ),
    );
  }

  Widget _buildSignUpButton() {
    return BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
      builder: (context, valState) {
        return BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return AppButton(
              title: 'Sign Up',
              isDisabled: valState.status.isInvalid || valState.status.isPure,
              width: 308.68,
              height: 61.11,
              color: const Color(0xFFF75F55),
              onTap: () {
                context.read<SignUpCubit>().signUp(valState.getSignUpRequest());
              },
            );
          },
        );
      },
    );
  }

  Widget _buildNameTextField() {
    return BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
      builder: (context, state) {
        final formz = state.username;
        return AppTextField(
          labelText: 'Name',
          prefixIconAssetPath: 'assets/images/person.svg',
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          cursorHeight: 20.35,
          fontSize: 17.36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15782825648784637,
          onChange: context.read<SignUpValidationCubit>().changeUserName,
          errorText: formz.status == FormzInputStatus.pure
              ? 'username_required'
              : formz.error,
        );
      },
    );
  }

  Widget _buildEmailTextField() {
    return BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
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
          onChange: context.read<SignUpValidationCubit>().changeEmailId,
          errorText: formz.status == FormzInputStatus.pure
              ? 'email_id_required'
              : formz.error,
        );
      },
    );
  }

  Widget _buildPasswordTextField() {
    return BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
      builder: (context, state) {
        final formz = state.password;
        return AppTextField(
          labelText: 'Password',
          prefixIconAssetPath: 'assets/images/lock.svg',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          cursorHeight: 20.35,
          obscureText: true,
          fontSize: 17.36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15782825648784637,
          onChange: context.read<SignUpValidationCubit>().changePassword,
          errorText: formz.status == FormzInputStatus.pure
              ? 'type_your_password'
              : formz.error,
        );
      },
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
      builder: (context, state) {
        final formz = state.confirmPassword;
        return AppTextField(
          labelText: 'Confirm Password',
          prefixIconAssetPath: 'assets/images/lock.svg',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          cursorHeight: 20.35,
          obscureText: true,
          fontSize: 17.36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15782825648784637,
          onChange: context.read<SignUpValidationCubit>().changeConfirmPassword,
          errorText: formz.status == FormzInputStatus.pure
              ? 'confirm_password_req'
              : formz.error,
        );
      },
    );
  }
}
