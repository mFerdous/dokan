class ErrorMsgRes {
  ErrorMsgRes._init();

  static const kNoInternet = 'Please check your network connectivity';

  static const kUserIdRequired = 'sign-in_id_req';
  static const kPasswordRequired = 'sign-in_pass_req';

  static const kNewPasswordRequired = 'new_password_req';
  static const kConfirmPasswordRequired = 'confirm_password_req';
  static const kPasswordShouldChar =
      'Password should at lease one special character';
  static const kPassword8Char = 'set-password_passmin';
  static const kPasswordNotMatch = 'set-password_passmatch';

  static const kEmailIdRequired = 'email_id_required';
  static const kMobileNoRequired = 'mobile_no_required';
  static const kInvalidMobileNo = 'invalid_mobile_no';
  static const kInvalidEmailId = 'invalid_email_id';

  static const kOtpRequired = 'otp_required';
  static const kOtpInvalid = 'otp_invalid';

  static const kNoMessageFound = 'No message found from server';
  static const kServerError = 'common_server_error';
  static const kPasswordInvalid = 'password_invalid';
}
