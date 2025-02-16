part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthenticationStatus status;
  final FormzSubmissionStatus statusSms;
  final UserModel userModel;
  final bool isState;

  const AuthState({
    this.status = AuthenticationStatus.loading,
    this.statusSms = FormzSubmissionStatus.initial,
    this.userModel = const UserModel(),
    this.isState = false,
  });

  AuthState copyWith({
    AuthenticationStatus? status,
    FormzSubmissionStatus? statusSms,
    UserModel? userModel,
    bool? isState,
  }) {
    return AuthState(
      status: status ?? this.status,
      statusSms: statusSms ?? this.statusSms,
      userModel: userModel ?? this.userModel,
      isState: isState ?? this.isState,
    );
  }

  @override
  List<Object?> get props => [status, statusSms, userModel, isState];
}
