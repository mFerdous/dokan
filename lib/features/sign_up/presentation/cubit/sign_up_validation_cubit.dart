// ignore_for_file: empty_catches

import 'package:dokan/features/sign_up/data/model/sign_up_request.dart';
import 'package:dokan/features/sign_up/presentation/cubit/confirm_password_formz.dart';
import 'package:dokan/features/sign_up/presentation/cubit/password_formz.dart';
import 'package:dokan/features/sign_up/presentation/cubit/username_formz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dokan/core/utils/formz.dart';
import 'package:dokan/features/sign_in/presentation/cubit/email_id_formz.dart';

part 'sign_up_validation_state.dart';

class SignUpValidationCubit extends Cubit<SignUpValidationState> {
  SignUpValidationCubit() : super(SignUpValidationInitial());

  changeObscureStatus(bool obscureStatus) {
    emit(state.copyWith(obscureStatus: obscureStatus));
  }

  void changeUserName(String value) {
    final username = UsernameFormz.dirty(value: value);

    emit(state.copyWith(
      username: username,
      status: Formz.validate([
        username,
        state.emailId,
        state.password,
        state.confirmPassword,
      ]),
    ));
  }

  void changeEmailId(String value) {
    final emailId = EmailIdFormz.dirty(value: value);

    emit(state.copyWith(
      emailId: emailId,
      status: Formz.validate([
        state.username,
        emailId,
        state.password,
        state.confirmPassword,
      ]),
    ));
  }

  void changePassword(String value) {
    final password = PasswordFormz.dirty(value: value);

    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        state.username,
        state.emailId,
        password,
        state.confirmPassword,
      ]),
    ));
    changeConfirmPassword(state.confirmPassword.value);

  }

  void changeConfirmPassword(String value) {
    final confirmPassword = ConfirmPasswordFormz.dirty(
        value: value, password: state.password.value);

    emit(state.copyWith(
      password: state.password,
      confirmPassword: confirmPassword,
      status: Formz.validate([confirmPassword]),
    ));
  }
}
