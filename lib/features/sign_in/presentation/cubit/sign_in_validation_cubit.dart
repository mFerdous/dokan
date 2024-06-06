// ignore_for_file: empty_catches

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dokan/core/utils/formz.dart';
import 'package:dokan/features/sign_in/presentation/cubit/email_id_formz.dart';


part 'sign_in_validation_state.dart';

class SignInValidationCubit extends Cubit<SignInValidationState> {
  SignInValidationCubit() : super(SignInValidationInitial());

  changeObscureStatus(bool obscureStatus) {
    emit(state.copyWith(obscureStatus: obscureStatus));
  }

  void changeEmailId(String value) {
    final emailId = EmailIdFormz.dirty(value: value);

    emit(state.copyWith(
      emailId: emailId,
      status: Formz.validate([emailId]),
    ));
  }
}
