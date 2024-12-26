// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmsCodeModel _$SmsCodeModelFromJson(Map<String, dynamic> json) => SmsCodeModel(
      error: json['error'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: (json['status'] as num).toInt(),
      path: json['path'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      response: json['response'],
    );

Map<String, dynamic> _$SmsCodeModelToJson(SmsCodeModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
      'status': instance.status,
      'path': instance.path,
      'data': instance.data,
      'response': instance.response,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      sessionToken: json['session_token'] as String,
      headers: Headers.fromJson(json['headers'] as Map<String, dynamic>),
      securityCode: json['security_code'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'session_token': instance.sessionToken,
      'headers': instance.headers,
      'security_code': instance.securityCode,
    };

Headers _$HeadersFromJson(Map<String, dynamic> json) => Headers(
      userAgent: json['user_agent'] as String,
    );

Map<String, dynamic> _$HeadersToJson(Headers instance) => <String, dynamic>{
      'user_agent': instance.userAgent,
    };
