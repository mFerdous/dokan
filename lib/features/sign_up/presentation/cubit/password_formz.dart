

import '../../../../core/resources/error_msg_res.dart';
import '../../../../core/utils/formz.dart';

class PasswordFormz extends FormzInput<String, String> {
  const PasswordFormz.pure() : super.pure('');

  const PasswordFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return ErrorMsgRes.kNewPasswordRequired;
    } 
    else if(value.length < 6)
    
    {
      return ErrorMsgRes.kPasswordInvalid;
    } else {
      return null;
    }
  }
}
