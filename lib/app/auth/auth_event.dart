part of 'auth_bloc.dart';

sealed class AuthEvent {}

class GetMeEvent extends AuthEvent {}

class UpdateCode extends AuthEvent {
  final String code;
  final String? note;

  UpdateCode({
    required this.code,
    this.note,
  });
}

class CheckUserEvent extends AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final String name;
  final String lastName;
  final String phone;
  final bool isUser;
  final VoidCallback onSucces;

  RegisterUserEvent({
    required this.name,
    required this.lastName,
    required this.phone,
    required this.onSucces,
    required this.isUser,
  });
}

class UpdateUserEvent extends AuthEvent {
  final String? name;
  final String? lastName;
  final String phone;
  final String? images;
  final String? tgName;
  final String? smsType;
  final String? sessionToken;
  final String? securityCode;
  final String? orgName;
  final String? callPhone;
  final String? referredBy;
  final String? tin;
  final String? userType;
  final VoidCallback onSucces;
  final VoidCallback onError;

  UpdateUserEvent({
    this.name,
    this.lastName,
    required this.phone,
    required this.onSucces,
    required this.onError,
    this.images,
    this.tgName,
    this.smsType,
    this.userType,
    this.sessionToken,
    this.securityCode,
    this.orgName,
    this.callPhone,
    this.referredBy,
    this.tin,
  });
}

class SendCodeEvent extends AuthEvent {
  final String phone;
  final VoidCallback onError;
  final bool isLogin;
  final bool isPhone;
  final Function(SendCodeModel model) onSucces;

  SendCodeEvent({
    required this.phone,
    required this.onError,
    required this.onSucces,
    required this.isLogin,
    required this.isPhone,
  });
}

class VerifyEvent extends AuthEvent {
  final String phone;
  final String sessionToken;
  final String securityCode;
  final bool isLogin;
  final bool isPhone;
  final VoidCallback onError;
  final Function() onSucces;

  VerifyEvent({
    required this.phone,
    required this.onError,
    required this.onSucces,
    required this.sessionToken,
    required this.securityCode,
    required this.isLogin,
    required this.isPhone,
  });
}

class LogOutEvent extends AuthEvent {}

class RefreshToken extends AuthEvent {}
