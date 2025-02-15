part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthenticationStatus status;
  final FormzSubmissionStatus statusSms;
  final UserModel userModel;

  const AuthState({
    this.status = AuthenticationStatus.loading,
    this.statusSms = FormzSubmissionStatus.initial,
    this.userModel = const UserModel(),
  });

  AuthState copyWith({
    AuthenticationStatus? status,
    FormzSubmissionStatus? statusSms,
    UserModel? userModel,
  }) {
    return AuthState(
      status: status ?? this.status,
      statusSms: statusSms ?? this.statusSms,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [status, statusSms, userModel];
}
