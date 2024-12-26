// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyBody _$VerifyBodyFromJson(Map<String, dynamic> json) => VerifyBody(
      phoneNumber: json['phone_number'] as String,
      sessionToken: json['session_token'] as String,
      securityCode: json['security_code'] as String,
    );

Map<String, dynamic> _$VerifyBodyToJson(VerifyBody instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'session_token': instance.sessionToken,
      'security_code': instance.securityCode,
    };
