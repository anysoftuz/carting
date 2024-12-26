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
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "user_type")
  final String userType;
  @JsonKey(name: "phone_number")
  final String phoneNumber;

  UserUpdateModel({
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.phoneNumber,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateModelToJson(this);
}
