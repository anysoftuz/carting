// To parse this JSON data, do
//
//     final sendCodeBody = sendCodeBodyFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'send_code_body.g.dart';

SendCodeBody sendCodeBodyFromJson(String str) =>
    SendCodeBody.fromJson(json.decode(str));

String sendCodeBodyToJson(SendCodeBody data) => json.encode(data.toJson());

@JsonSerializable()
class SendCodeBody {
  @JsonKey(name: "mail", includeIfNull: false)
  final String? mail;
  @JsonKey(name: "phone_number", includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: "sms_type")
  final String smsType;
  @JsonKey(name: "type")
  final int type;

  SendCodeBody({
    this.mail,
    this.phoneNumber,
    required this.smsType,
    required this.type,
  });

  factory SendCodeBody.fromJson(Map<String, dynamic> json) =>
      _$SendCodeBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeBodyToJson(this);
}
