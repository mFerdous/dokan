import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/header_provider/header_provider.dart';
import '../model/sign_in_request.dart';
import '../model/sign_in_response.dart';

abstract class SignInRemote {
  Future<SignInResponse> signIn(SignInRequest signUpRequest);
}

class SignInRemoteImpl implements SignInRemote {
  static const signInEndpoint =
      ApiConstants.baseApiUrl + ApiConstants.signInUrl;
  final HeaderProvider _headerProvider;

  SignInRemoteImpl(this._headerProvider);

  @override
  Future<SignInResponse> signIn(SignInRequest signInRequest) async {
    SignInResponse res;

    final headers = _headerProvider();

    final response = await http.post(Uri.parse(signInEndpoint),
        body: json.encode(signInRequest), headers: headers);

    final Map<String, dynamic> map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      res = signInResponseFromJson(response.body);
      return res;
    } else {

      
      throw ServerException(
        message: map['message'],
        statusCode: map['data']['status'],
      );
    }
  }
}
