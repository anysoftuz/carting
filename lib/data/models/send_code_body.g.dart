// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeBody _$SendCodeBodyFromJson(Map<String, dynamic> json) => SendCodeBody(
      mail: json['mail'] as String?,
      phoneNumber: json['phone_number'] as String?,
      smsType: json['sms_type'] as String,
      type: (json['type'] as num).toInt(),
    );

Map<String, dynamic> _$SendCodeBodyToJson(SendCodeBody instance) =>
    <String, dynamic>{
      if (instance.mail case final value?) 'mail': value,
      if (instance.phoneNumber case final value?) 'phone_number': value,
      'sms_type': instance.smsType,
      'type': instance.type,
    };
