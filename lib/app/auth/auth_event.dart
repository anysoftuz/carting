part of 'auth_bloc.dart';

sealed class AuthEvent {}

class GetMeEvent extends AuthEvent {}

class CheckUserEvent extends AuthEvent {}

class UpdateUserEvent extends AuthEvent {
  final String name;
  final String lastName;
  final String phone;
  final String? images;
  final String? tgName;
  final VoidCallback onSucces;

  UpdateUserEvent({
    required this.name,
    required this.lastName,
    required this.phone,
    required this.onSucces,
    this.images,
    this.tgName,
  });
}

class SendCodeEvent extends AuthEvent {
  final String phone;
  final VoidCallback onError;
  final bool isLogin;
  final Function(SendCodeModel model) onSucces;

  SendCodeEvent({
    required this.phone,
    required this.onError,
    required this.onSucces,
    required this.isLogin,
  });
}

class VerifyEvent extends AuthEvent {
  final String phone;
  final String sessionToken;
  final String securityCode;
  final bool isLogin;
  final VoidCallback onError;
  final Function() onSucces;

  VerifyEvent({
    required this.phone,
    required this.onError,
    required this.onSucces,
    required this.sessionToken,
    required this.securityCode,
    required this.isLogin,
  });
}

class LogOutEvent extends AuthEvent {}

class RefreshToken extends AuthEvent {}
