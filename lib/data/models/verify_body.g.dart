// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyBody _$VerifyBodyFromJson(Map<String, dynamic> json) => VerifyBody(
      username: json['username'] as String,
      smsType: json['sms_type'] as String,
      sessionToken: json['session_token'] as String,
      securityCode: json['security_code'] as String,
    );

Map<String, dynamic> _$VerifyBodyToJson(VerifyBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'sms_type': instance.smsType,
      'session_token': instance.sessionToken,
      'security_code': instance.securityCode,
    };
