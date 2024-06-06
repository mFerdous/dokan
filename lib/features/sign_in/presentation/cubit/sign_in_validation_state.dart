part of 'sign_in_validation_cubit.dart';

class SignInValidationState extends Equatable {
  final bool obscureStatus;
  final EmailIdFormz emailId;
  final FormzStatus status;

  const SignInValidationState({
    this.obscureStatus = true,
    this.emailId = const EmailIdFormz.pure(),
    this.status = FormzStatus.pure,
  });

  SignInValidationState copyWith({
    final bool? obscureStatus,
    EmailIdFormz? emailId,
    FormzStatus? status,
  }) {
    return SignInValidationState(
      obscureStatus: obscureStatus ?? this.obscureStatus,
      emailId: emailId ?? this.emailId,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        obscureStatus,
        emailId,
      ];
}

final class SignInValidationInitial extends SignInValidationState {}
