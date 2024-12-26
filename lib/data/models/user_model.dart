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

 const UserModel({
    this.id = 0,
    this.username = '',
    this.fullName = '',
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.type = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
