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
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "sms_type")
  final String smsType;
  @JsonKey(name: "type")
  final int type;

  SendCodeBody({
    required this.username,
    required this.smsType,
    required this.type,
  });

  factory SendCodeBody.fromJson(Map<String, dynamic> json) =>
      _$SendCodeBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeBodyToJson(this);
}
