// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'token_model.g.dart';

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

@JsonSerializable()
class TokenModel {
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "refreshToken")
  final String refreshToken;
  @JsonKey(name: "status")
  final String status;

  TokenModel({
    this.token = '',
    this.refreshToken = '',
    this.status = '',
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
