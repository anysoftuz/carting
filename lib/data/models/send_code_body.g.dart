// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeBody _$SendCodeBodyFromJson(Map<String, dynamic> json) => SendCodeBody(
      username: json['username'] as String,
      smsType: json['sms_type'] as String,
      type: (json['type'] as num).toInt(),
    );

Map<String, dynamic> _$SendCodeBodyToJson(SendCodeBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'sms_type': instance.smsType,
      'type': instance.type,
    };
