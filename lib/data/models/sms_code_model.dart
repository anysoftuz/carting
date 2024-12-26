// To parse this JSON data, do
//
//     final smsCodeModel = smsCodeModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'sms_code_model.g.dart';

SmsCodeModel smsCodeModelFromJson(String str) => SmsCodeModel.fromJson(json.decode(str));

String smsCodeModelToJson(SmsCodeModel data) => json.encode(data.toJson());

@JsonSerializable()
class SmsCodeModel {
    @JsonKey(name: "error")
    final dynamic error;
    @JsonKey(name: "message")
    final dynamic message;
    @JsonKey(name: "timestamp")
    final DateTime timestamp;
    @JsonKey(name: "status")
    final int status;
    @JsonKey(name: "path")
    final dynamic path;
    @JsonKey(name: "data")
    final Data data;
    @JsonKey(name: "response")
    final dynamic response;

    SmsCodeModel({
        required this.error,
        required this.message,
        required this.timestamp,
        required this.status,
        required this.path,
        required this.data,
        required this.response,
    });

    factory SmsCodeModel.fromJson(Map<String, dynamic> json) => _$SmsCodeModelFromJson(json);

    Map<String, dynamic> toJson() => _$SmsCodeModelToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "session_token")
    final String sessionToken;
    @JsonKey(name: "headers")
    final Headers headers;
    @JsonKey(name: "security_code")
    final String securityCode;

    Data({
        required this.sessionToken,
        required this.headers,
        required this.securityCode,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Headers {
    @JsonKey(name: "user_agent")
    final String userAgent;

    Headers({
        required this.userAgent,
    });

    factory Headers.fromJson(Map<String, dynamic> json) => _$HeadersFromJson(json);

    Map<String, dynamic> toJson() => _$HeadersToJson(this);
}
