// To parse this JSON data, do
//
//     final userUpdateModel = userUpdateModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_update_model.g.dart';

UserUpdateModel userUpdateModelFromJson(String str) =>
    UserUpdateModel.fromJson(json.decode(str));

String userUpdateModelToJson(UserUpdateModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class UserUpdateModel {
  @JsonKey(name: "sms_type", includeIfNull: false)
  final String? smsType;
  @JsonKey(name: "tin", includeIfNull: false)
  final int? tin;
  @JsonKey(name: "session_token", includeIfNull: false)
  final String? sessionToken;
  @JsonKey(name: "security_code", includeIfNull: false)
  final String? securityCode;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "user_type")
  final String userType;
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @JsonKey(name: "tg_link", includeIfNull: false)
  final String? tgLink;
  @JsonKey(name: "base64", includeIfNull: false)
  final String? base64;
  @JsonKey(name: "org_name")
  final String orgName;
  @JsonKey(name: "call_phone", includeIfNull: false)
  final String? callPhone;
  @JsonKey(name: "mail")
  final String mail;
  @JsonKey(name: "referred_by", includeIfNull: false)
  final String? referredBy;

  UserUpdateModel({
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.phoneNumber,
    this.tin,
    this.tgLink,
    this.base64,
    this.smsType,
    this.sessionToken,
    this.securityCode,
    this.orgName = '',
    this.callPhone,
    this.referredBy = '',
    required this.mail,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateModelToJson(this);
}
