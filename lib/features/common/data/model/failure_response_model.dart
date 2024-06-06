import 'dart:convert';

class FailureResponseModel {
  final String code;
  final String message;
  final int? status;

  FailureResponseModel({
    required this.code,
    required this.message,
    this.status,
  });

  factory FailureResponseModel.fromJsonString(String jsonString) {
    final Map<String, dynamic> decodedResponse = json.decode(jsonString);
    String code = "";
    String message = "";
    int? status;

    if (decodedResponse.containsKey("code")) {
      code = decodedResponse["code"];
    }
    if (decodedResponse.containsKey("message")) {
      message = decodedResponse["message"];
    }
    if (decodedResponse.containsKey("data") && decodedResponse["data"].containsKey("status")) {
      status = decodedResponse["data"]["status"];
    }

    return FailureResponseModel(
      code: code,
      message: message,
      status: status,
    );
  }
}
