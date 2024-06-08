part of 'sign_up_validation_cubit.dart';

class SignUpValidationState extends Equatable {
  final bool obscureStatus;
  final UsernameFormz username;
  final EmailIdFormz emailId;
  final PasswordFormz password;
  final ConfirmPasswordFormz confirmPassword;
  final FormzStatus status;

  const SignUpValidationState({
    this.obscureStatus = true,
    this.username = const UsernameFormz.pure(),
    this.emailId = const EmailIdFormz.pure(),
    this.password = const PasswordFormz.pure(),
    this.confirmPassword = const ConfirmPasswordFormz.pure(password: ''),
    this.status = FormzStatus.pure,
  });

  SignUpValidationState copyWith({
    final bool? obscureStatus,
    UsernameFormz? username,
    EmailIdFormz? emailId,
    PasswordFormz? password,
    ConfirmPasswordFormz? confirmPassword,
    FormzStatus? status,
  }) {
    return SignUpValidationState(
      obscureStatus: obscureStatus ?? this.obscureStatus,
      username: username ?? this.username,
      emailId: emailId ?? this.emailId,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }

  SignUpRequest getSignUpRequest() {
    return SignUpRequest(
        username: username.value,
        email: emailId.value,
        password: password.value);
  }

  @override
  List<Object> get props => [
        obscureStatus,
        username,
        emailId,
        password,
        confirmPassword,
      ];
}

final class SignUpValidationInitial extends SignUpValidationState {}
