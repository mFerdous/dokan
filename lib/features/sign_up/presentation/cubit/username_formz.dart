

import '../../../../core/resources/error_msg_res.dart';
import '../../../../core/utils/formz.dart';

class UsernameFormz extends FormzInput<String, String> {
  const UsernameFormz.pure() : super.pure('');

  const UsernameFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return ErrorMsgRes.kUserNameRequired;
    } else {
      return null;
    }
  }
}
