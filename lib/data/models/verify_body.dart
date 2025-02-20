// To parse this JSON data, do
//
//     final verifyBody = verifyBodyFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'verify_body.g.dart';

VerifyBody verifyBodyFromJson(String str) =>
    VerifyBody.fromJson(json.decode(str));

String verifyBodyToJson(VerifyBody data) => json.encode(data.toJson());

@JsonSerializable()
class VerifyBody {
  @JsonKey(name: "mail", includeIfNull: false)
  final String? mail;
  @JsonKey(name: "phone_number", includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: "sms_type")
  final String smsType;
  @JsonKey(name: "session_token")
  final String sessionToken;
  @JsonKey(name: "security_code")
  final String securityCode;

  VerifyBody({
    this.mail,
    this.phoneNumber,
    required this.smsType,
    required this.sessionToken,
    required this.securityCode,
  });

  factory VerifyBody.fromJson(Map<String, dynamic> json) =>
      _$VerifyBodyFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyBodyToJson(this);
}
