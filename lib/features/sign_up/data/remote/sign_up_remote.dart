import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/header_provider/header_provider.dart';
import '../model/sign_up_request.dart';
import '../model/sign_up_response.dart';

abstract class SignUpRemote {
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest);
}

class SignUpRemoteImpl implements SignUpRemote {
  static const signUpEndpoint =
      ApiConstants.baseApiUrl + ApiConstants.signUpUrl;
  final HeaderProvider _apiHeaderProvider;
  SignUpRemoteImpl(this._apiHeaderProvider);

  @override
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async {
    debugPrint('request from remote::: ${json.encode(signUpRequest)}');
    SignUpResponse res;
    final headers = _apiHeaderProvider();
    final response = await http.post(Uri.parse(signUpEndpoint),
        body: json.encode(signUpRequest), headers: headers);
    log(json.encode(response.body));

    final Map<String, dynamic> map = jsonDecode(response.body);
    final code = map['code'];

    if (response.statusCode == 200) {
      if (code == 200) {
        res = signUpResponseFromJson(response.body);
        return res;
      } else {
        throw ServerException(
          message: map['message'],
          statusCode: code,
        );
      }
    } else {
      throw ServerException(
        message: map['message'], //ErrorMsgRes.kServerError,
        statusCode: response.statusCode,
      );
    }
  }
}
