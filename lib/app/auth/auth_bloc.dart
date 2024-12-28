import 'dart:ui';

import 'package:carting/assets/constants/app_constants.dart';
import 'package:carting/assets/constants/storage_keys.dart';
import 'package:carting/data/models/send_code_body.dart';
import 'package:carting/data/models/send_code_model.dart';
import 'package:carting/data/models/user_model.dart';
import 'package:carting/data/models/user_update_model.dart';
import 'package:carting/data/models/verify_body.dart';
import 'package:carting/infrastructure/repo/auth_repo.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:carting/utils/log_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
  cancelLoading,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _repository;
  AuthBloc(this._repository) : super(const AuthState()) {
    on<RefreshToken>((event, emit) async {
      final result = await _repository.refreshToken();
      if (result.isRight) {
        add(GetMeEvent());
      } else {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }
    });

    on<RegisterUserEvent>((event, emit) async {
      emit(state.copyWith(statusSms: FormzSubmissionStatus.inProgress));
      final result = await _repository.registerPost(UserUpdateModel(
        firstName: event.name,
        lastName: event.lastName,
        userType: event.isUser ? 'PHYSICAL' : 'CLIENT',
        phoneNumber: event.phone,
        tgLink: AppConstants.tgLink,
        base64: AppConstants.image,
      ));
      if (result.isRight) {
        add(GetMeEvent());
      } else {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }
    });

    on<UpdateUserEvent>((event, emit) async {
      emit(state.copyWith(
        statusSms: FormzSubmissionStatus.inProgress,
        status: AuthenticationStatus.loading,
      ));
      final response = await _repository.userUpdate(
        UserUpdateModel(
          firstName: event.name,
          lastName: event.lastName,
          userType:
              state.userModel.type.isEmpty ? "CLIENT" : state.userModel.type,
          phoneNumber: event.phone,
          tgLink: event.tgName ?? '/test',
          base64: event.images,
        ),
      );
      if (response.isRight) {
        await Future.delayed(const Duration(seconds: 5), () {
          emit(state.copyWith(
            statusSms: FormzSubmissionStatus.inProgress,
            status: AuthenticationStatus.loading,
          ));
          add(GetMeEvent());
        });
      } else {
        emit(state.copyWith(statusSms: FormzSubmissionStatus.failure));
      }
    });
    on<CheckUserEvent>((event, emit) {
      final token = StorageRepository.getString(StorageKeys.TOKEN);
      if (token.isEmpty) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      } else {
        add(GetMeEvent());
      }
    });
    on<SendCodeEvent>((event, emit) async {
      emit(state.copyWith(
        statusSms: FormzSubmissionStatus.inProgress,
        status: AuthenticationStatus.loading,
      ));
      final response = await _repository.sendCode(
        SendCodeBody(
          phoneNumber: event.phone,
          type: event.isLogin ? 1 : 2,
        ),
      );
      if (response.isRight) {
        emit(state.copyWith(
          statusSms: FormzSubmissionStatus.success,
          status: AuthenticationStatus.loading,
        ));
        event.onSucces(response.right.data);
      } else {
        emit(state.copyWith(
          statusSms: FormzSubmissionStatus.failure,
          status: AuthenticationStatus.loading,
        ));
        event.onError();
      }
    });

    on<VerifyEvent>((event, emit) async {
      emit(state.copyWith(statusSms: FormzSubmissionStatus.inProgress));
      final response = await _repository.verifyPost(
        VerifyBody(
          phoneNumber: event.phone,
          sessionToken: event.sessionToken,
          securityCode: event.securityCode,
        ),
      );
      if (response.isRight) {
        emit(state.copyWith(statusSms: FormzSubmissionStatus.success));
        if (event.isLogin) {
          add(GetMeEvent());
        } else {
          event.onSucces();
        }
      } else {
        emit(state.copyWith(statusSms: FormzSubmissionStatus.failure));
        event.onError();
      }
    });

    on<GetMeEvent>((event, emit) async {
      final response = await _repository.getMe();
      if (response.isRight) {
        Log.i("Salom Loginga kirdik");
        emit(state.copyWith(
          status: AuthenticationStatus.authenticated,
          userModel: response.right.data,
          statusSms: FormzSubmissionStatus.initial,
        ));
        Log.i("Salom Loginga kirdik holat ${state.status}");
      } else {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }
    });

    on<LogOutEvent>((event, emit) async {
      emit(state.copyWith(statusSms: FormzSubmissionStatus.inProgress));
      await StorageRepository.putString(StorageKeys.TOKEN, "");
      await StorageRepository.putString(StorageKeys.REFRESH, "");
      emit(state.copyWith(
        statusSms: FormzSubmissionStatus.success,
        status: AuthenticationStatus.unauthenticated,
      ));
    });
  }
}
