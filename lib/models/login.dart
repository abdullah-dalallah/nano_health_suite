// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';


Login loginResponseFromJson(String str) => Login.fromJson(json.decode(str));

String loginResponseToJson(Login data) => json.encode(data.toJson());
@JsonSerializable()
class Login {
  String? token;

  Login({
    this.token,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
