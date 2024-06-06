part of 'sign_up_validation_cubit.dart';

class SignUpValidationState extends Equatable {
  final bool obscureStatus;
  final EmailIdFormz emailId;
  final FormzStatus status;

  const SignUpValidationState({
    this.obscureStatus = true,
    this.emailId = const EmailIdFormz.pure(),
    this.status = FormzStatus.pure,
  });

  SignUpValidationState copyWith({
    final bool? obscureStatus,
    EmailIdFormz? emailId,
    FormzStatus? status,
  }) {
    return SignUpValidationState(
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

final class SignUpValidationInitial extends SignUpValidationState {}
