// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateModel _$UserUpdateModelFromJson(Map<String, dynamic> json) =>
    UserUpdateModel(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      userType: json['user_type'] as String,
      phoneNumber: json['phone_number'] as String,
      tin: (json['tin'] as num?)?.toInt(),
      tgLink: json['tg_link'] as String?,
      base64: json['base64'] as String?,
      smsType: json['sms_type'] as String?,
      sessionToken: json['session_token'] as String?,
      securityCode: json['security_code'] as String?,
      orgName: json['org_name'] as String? ?? '',
      callPhone: json['call_phone'] as String?,
      referredBy: json['referred_by'] as String? ?? '',
      mail: json['mail'] as String?,
    );

Map<String, dynamic> _$UserUpdateModelToJson(UserUpdateModel instance) =>
    <String, dynamic>{
      if (instance.smsType case final value?) 'sms_type': value,
      if (instance.tin case final value?) 'tin': value,
      if (instance.sessionToken case final value?) 'session_token': value,
      if (instance.securityCode case final value?) 'security_code': value,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'user_type': instance.userType,
      'phone_number': instance.phoneNumber,
      if (instance.tgLink case final value?) 'tg_link': value,
      if (instance.base64 case final value?) 'base64': value,
      'org_name': instance.orgName,
      if (instance.callPhone case final value?) 'call_phone': value,
      if (instance.mail case final value?) 'mail': value,
      if (instance.referredBy case final value?) 'referred_by': value,
    };
