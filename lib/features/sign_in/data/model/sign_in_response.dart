// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromJson(String str) => SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
    final String token;
    final String userEmail;
    final String userNicename;
    final String userDisplayName;

    SignInResponse({
        required this.token,
        required this.userEmail,
        required this.userNicename,
        required this.userDisplayName,
    });

    factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
    };
}
