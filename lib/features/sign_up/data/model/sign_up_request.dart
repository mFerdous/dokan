import 'dart:convert';

SignUpRequest signUpRequestFromJson(String str) => SignUpRequest.fromJson(json.decode(str));

String signUpRequestToJson(SignUpRequest data) => json.encode(data.toJson());

class SignUpRequest {
    final String? username;
    final String? email;
    final String? password;

    SignUpRequest({
        this.username,
        this.email,
        this.password,
    });

    factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        username: json["username"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
    };
}
