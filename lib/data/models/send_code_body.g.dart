// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeBody _$SendCodeBodyFromJson(Map<String, dynamic> json) => SendCodeBody(
      phoneNumber: json['phone_number'] as String,
      type: (json['type'] as num).toInt(),
    );

Map<String, dynamic> _$SendCodeBodyToJson(SendCodeBody instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'type': instance.type,
    };
