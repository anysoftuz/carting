// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@JsonSerializable()
class UserModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "tg_link")
  final String tgLink;
  @JsonKey(name: "photo")
  final String photo;
  @JsonKey(name: "referral_code")
  final String? referralCode;
  @JsonKey(name: "referral_users")
  final List<ReferralUser> referralUsers;
  @JsonKey(name: "referral_codes")
  final List<ReferralCode> referralCodes;

  const UserModel({
    this.id = 0,
    this.username = '',
    this.fullName = '',
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.type = '',
    this.tgLink = '',
    this.photo = '',
    this.referralCode,
    this.referralUsers = const [],
    this.referralCodes = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class ReferralCode {
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "note")
  final String note;

  ReferralCode({
    required this.code,
    required this.note,
  });

  factory ReferralCode.fromJson(Map<String, dynamic> json) =>
      _$ReferralCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralCodeToJson(this);
}

@JsonSerializable()
class ReferralUser {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "client_type")
  final String clientType;
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @JsonKey(name: "photo")
  final String photo;

  ReferralUser({
    required this.id,
    required this.fullName,
    required this.clientType,
    required this.phoneNumber,
    required this.photo,
  });

  factory ReferralUser.fromJson(Map<String, dynamic> json) =>
      _$ReferralUserFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralUserToJson(this);
}
