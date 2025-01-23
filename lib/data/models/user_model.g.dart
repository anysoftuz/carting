// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      username: json['username'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      type: json['type'] as String? ?? '',
      tgLink: json['tg_link'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      totalProfit: (json['total_profit'] as num?)?.toInt() ?? 0,
      earnedProfit: (json['earned_profit'] as num?)?.toInt() ?? 0,
      withdrawnProfit: (json['withdrawn_profit'] as num?)?.toInt() ?? 0,
      referralCount: (json['referral_count'] as num?)?.toInt() ?? 0,
      referralUsers: (json['referral_users'] as List<dynamic>?)
              ?.map((e) => ReferralUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      referralCodes: (json['referral_codes'] as List<dynamic>?)
              ?.map((e) => ReferralCode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'full_name': instance.fullName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'type': instance.type,
      'tg_link': instance.tgLink,
      'photo': instance.photo,
      'total_profit': instance.totalProfit,
      'earned_profit': instance.earnedProfit,
      'withdrawn_profit': instance.withdrawnProfit,
      'referral_count': instance.referralCount,
      'referral_users': instance.referralUsers,
      'referral_codes': instance.referralCodes,
    };

ReferralCode _$ReferralCodeFromJson(Map<String, dynamic> json) => ReferralCode(
      code: json['code'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$ReferralCodeToJson(ReferralCode instance) =>
    <String, dynamic>{
      'code': instance.code,
      'note': instance.note,
    };

ReferralUser _$ReferralUserFromJson(Map<String, dynamic> json) => ReferralUser(
      id: (json['id'] as num).toInt(),
      fullName: json['full_name'] as String,
      clientType: json['client_type'] as String,
      phoneNumber: json['phone_number'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$ReferralUserToJson(ReferralUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'client_type': instance.clientType,
      'phone_number': instance.phoneNumber,
      'photo': instance.photo,
    };
