// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final FormzSubmissionStatus statusSms;
  final AuthenticationStatus status;
  final UserModel userModel;
  const AuthState({
    this.statusSms = FormzSubmissionStatus.initial,
    this.status = AuthenticationStatus.loading,
    this.userModel = const UserModel(),
  });

  @override
  List<Object> get props => [
        statusSms,
        status,
        userModel,
      ];

  AuthState copyWith({
    FormzSubmissionStatus? statusSms,
    AuthenticationStatus? status,
    UserModel? userModel,
  }) {
    return AuthState(
      statusSms: statusSms ?? this.statusSms,
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
    );
  }
}
