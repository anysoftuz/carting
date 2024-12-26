// To parse this JSON data, do
//
//     final sendCodeModel = sendCodeModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'send_code_model.g.dart';

SendCodeModel sendCodeModelFromJson(String str) =>
    SendCodeModel.fromJson(json.decode(str));

String sendCodeModelToJson(SendCodeModel data) => json.encode(data.toJson());

@JsonSerializable()
class SendCodeModel {
  @JsonKey(name: "session_token")
  final String sessionToken;
  @JsonKey(name: "headers")
  final Headers headers;
  @JsonKey(name: "security_code")
  final String securityCode;
  @JsonKey(name: "validation")
  final Validation validation;

  SendCodeModel({
    this.sessionToken = '',
    this.headers = const Headers(),
    this.securityCode = '',
    this.validation = const Validation(),
  });

  factory SendCodeModel.fromJson(Map<String, dynamic> json) =>
      _$SendCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeModelToJson(this);
}

@JsonSerializable()
class Headers {
  @JsonKey(name: "user_agent")
  final String userAgent;

  const Headers({
    this.userAgent = '',
  });

  factory Headers.fromJson(Map<String, dynamic> json) =>
      _$HeadersFromJson(json);

  Map<String, dynamic> toJson() => _$HeadersToJson(this);
}

@JsonSerializable()
class Validation {
  const Validation();

  factory Validation.fromJson(Map<String, dynamic> json) =>
      _$ValidationFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationToJson(this);
}
