

import '../../../../core/resources/error_msg_res.dart';
import '../../../../core/utils/formz.dart';

class ConfirmPasswordFormz extends FormzInput<String, String> {
  final String password;

  const ConfirmPasswordFormz.pure({
    required this.password,
  }) : super.pure('');

  const ConfirmPasswordFormz.dirty({
    String value = '',
    required this.password,
  }) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return ErrorMsgRes.kConfirmPasswordRequired;
    } else if (password != value) {
      return ErrorMsgRes.kPasswordNotMatch;
    } else {
      return null;
    }
  }
}
