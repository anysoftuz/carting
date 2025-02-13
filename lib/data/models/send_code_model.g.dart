// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeModel _$SendCodeModelFromJson(Map<String, dynamic> json) =>
    SendCodeModel(
      sessionToken: json['session_token'] as String? ?? '',
      headers: json['headers'] == null
          ? const Headers()
          : Headers.fromJson(json['headers'] as Map<String, dynamic>),
      securityCode: json['security_code'] as String? ?? '',
    );

Map<String, dynamic> _$SendCodeModelToJson(SendCodeModel instance) =>
    <String, dynamic>{
      'session_token': instance.sessionToken,
      'headers': instance.headers,
      'security_code': instance.securityCode,
    };

Headers _$HeadersFromJson(Map<String, dynamic> json) => Headers(
      userAgent: json['user_agent'] as String? ?? '',
    );

Map<String, dynamic> _$HeadersToJson(Headers instance) => <String, dynamic>{
      'user_agent': instance.userAgent,
    };
