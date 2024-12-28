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
      validation: json['validation'] == null
          ? const Validation()
          : Validation.fromJson(json['validation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendCodeModelToJson(SendCodeModel instance) =>
    <String, dynamic>{
      'session_token': instance.sessionToken,
      'headers': instance.headers,
      'security_code': instance.securityCode,
      'validation': instance.validation,
    };

Headers _$HeadersFromJson(Map<String, dynamic> json) => Headers(
      userAgent: json['user_agent'] as String? ?? '',
    );

Map<String, dynamic> _$HeadersToJson(Headers instance) => <String, dynamic>{
      'user_agent': instance.userAgent,
    };

Validation _$ValidationFromJson(Map<String, dynamic> json) => const Validation();

Map<String, dynamic> _$ValidationToJson(Validation instance) =>
    <String, dynamic>{};
