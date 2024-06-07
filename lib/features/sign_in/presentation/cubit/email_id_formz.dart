import '../../../../core/resources/error_msg_res.dart';
import '../../../../core/resources/regex_res.dart';
import '../../../../core/utils/formz.dart';

class EmailIdFormz extends FormzInput<String, String> {
  const EmailIdFormz.pure() : super.pure('');

  const EmailIdFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return ErrorMsgRes.kEmailIdRequired;
    } else if (!RegexRes.kEmailId.hasMatch(value)) {
      return ErrorMsgRes.kInvalidEmailId;
    } else {
      return null;
    }
  }
}
