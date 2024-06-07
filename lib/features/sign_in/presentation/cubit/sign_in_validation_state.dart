part of 'sign_in_validation_cubit.dart';

class SignInValidationState extends Equatable {
  final bool obscureStatus;
  final EmailIdFormz emailId;
  final PasswordFormz password;
  final FormzStatus status;

  const SignInValidationState({
    this.obscureStatus = true,
    this.emailId = const EmailIdFormz.pure(),
    this.password = const PasswordFormz.pure(),
    this.status = FormzStatus.pure,
  });

  SignInValidationState copyWith({
    final bool? obscureStatus,
    EmailIdFormz? emailId,
    PasswordFormz? password,
    FormzStatus? status,
  }) {
    return SignInValidationState(
      obscureStatus: obscureStatus ?? this.obscureStatus,
      emailId: emailId ?? this.emailId,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }



  SignInRequest signInRequest() {
    return SignInRequest(
      username: emailId.value,
      password: password.value,
    );
  }

  @override
  List<Object> get props => [
        obscureStatus,
        emailId,
        password,
      ];
}

final class SignInValidationInitial extends SignInValidationState {
  const SignInValidationInitial();
}
